import Foundation
import UIKit

/// Keeps a run alive for as long as iOS allows it.
///
/// An apply on iOS 27 is a protective backup, a prune, an injection and a
/// restore. That is minutes on a small phone and much longer on a full one,
/// and nothing used to stop iOS from ending it halfway:
///   * auto-lock turned the screen off, the app was suspended, and the
///     backup's connection died with it (reported 2026-11-11 on 9.7.9);
///   * switching apps suspended it within seconds.
///
/// What this does, for every `loggedRun` (apply, reset, media, …):
///   * turns the idle timer off, so auto-lock never fires during a run, and
///     restores it afterwards;
///   * holds a UIKit background task, so a quick switch to another app (to
///     answer a prompt, say) gets iOS's ~30 s grace instead of an instant
///     suspension;
///   * writes to the app log when the app leaves the foreground or receives a
///     memory warning during a run, and leaves a marker that the next launch
///     reports if the run never finished, so a suspension and a memory kill
///     can be told apart afterwards.
///
/// It cannot keep a run going for long in the background: iOS gives a
/// sideloaded app no background mode that covers this work. The app has to
/// stay on screen.
enum RunKeepAlive {
    private static let markerKey = "RunKeepAlive.inFlight"
    private static var depth = 0
    private static var previousIdleTimer = false
    private static var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    private static var observers: [NSObjectProtocol] = []

    /// Called from `loggedRun` before the body runs.
    static func begin(_ label: String) {
        onMain {
            depth += 1
            guard depth == 1 else { return }
            let app = UIApplication.shared
            previousIdleTimer = app.isIdleTimerDisabled
            app.isIdleTimerDisabled = true
            backgroundTask = app.beginBackgroundTask(withName: "GoldenNugget.\(label)") {
                AppLog.write("keep-alive: iOS background time expired during \(label); "
                    + "the run will be suspended unless the app returns to the screen")
                endBackgroundTask()
            }
            UserDefaults.standard.set("\(label) started \(ISO8601DateFormatter().string(from: Date()))",
                                      forKey: markerKey)
            let center = NotificationCenter.default
            observers = [
                center.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                   object: nil, queue: .main) { _ in
                    AppLog.write("keep-alive: app left the foreground during \(label) "
                        + "(remaining background time \(Int(UIApplication.shared.backgroundTimeRemaining.rounded())) s)")
                },
                center.addObserver(forName: UIApplication.willEnterForegroundNotification,
                                   object: nil, queue: .main) { _ in
                    AppLog.write("keep-alive: app back on screen during \(label)")
                },
                center.addObserver(forName: UIApplication.didReceiveMemoryWarningNotification,
                                   object: nil, queue: .main) { _ in
                    AppLog.write("keep-alive: iOS memory warning during \(label)")
                },
            ]
            AppLog.write("keep-alive: screen auto-lock paused for \(label)")
        }
    }

    /// Called from `loggedRun` when the body returns or throws.
    static func end() {
        onMain {
            guard depth > 0 else { return }
            depth -= 1
            guard depth == 0 else { return }
            UIApplication.shared.isIdleTimerDisabled = previousIdleTimer
            endBackgroundTask()
            observers.forEach(NotificationCenter.default.removeObserver)
            observers = []
            UserDefaults.standard.removeObject(forKey: markerKey)
            AppLog.write("keep-alive: screen auto-lock restored")
        }
    }

    /// The run that was in flight when the app last died, if any. Read once at
    /// launch; clears the marker.
    static func takeUnfinishedRun() -> String? {
        let defaults = UserDefaults.standard
        guard let marker = defaults.string(forKey: markerKey) else { return nil }
        defaults.removeObject(forKey: markerKey)
        return marker
    }

    private static func endBackgroundTask() {
        guard backgroundTask != .invalid else { return }
        UIApplication.shared.endBackgroundTask(backgroundTask)
        backgroundTask = .invalid
    }

    private static func onMain(_ work: @escaping () -> Void) {
        if Thread.isMainThread { work() } else { DispatchQueue.main.async(execute: work) }
    }
}
