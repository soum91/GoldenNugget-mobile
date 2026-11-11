import AVFoundation
import Foundation

/// A silent, mixable audio session that keeps the app running in the
/// background while it holds a reason to.
///
/// Two jobs cannot finish inside the ~30 s a UIKit background task allows:
///   * **On-device pairing.** The user has to leave the app, open Settings →
///     Privacy & Security → Developer Mode, tap the pairable host and type the
///     PIN, while this app's listener answers the device's handshake. Once iOS
///     suspended the app, that listener froze, the handshake timed out, and the
///     device never listed GoldenNugget as paired (reported 2026-11-11).
///   * **A run.** A protective backup is minutes to hours. Leaving the app for
///     longer than the grace window used to suspend it mid-backup.
///
/// `UIBackgroundModes: audio` plus a playing, silent, `mixWithOthers` session
/// keeps the process scheduled for exactly as long as a holder exists. It is
/// started only by `RunKeepAlive` (runs) and `WirelessPairing` (pairing), stops
/// when the last holder releases it, never ducks or interrupts the user's own
/// audio, and produces no sound.
enum BackgroundAudio {
    private static var holders = 0
    private static var engine: AVAudioEngine?
    private static var player: AVAudioPlayerNode?

    /// Start (or join) the silent session. Main thread.
    static func acquire(_ reason: String) {
        holders += 1
        guard holders == 1 else { return }
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try session.setActive(true)

            let engine = AVAudioEngine()
            let player = AVAudioPlayerNode()
            let format = engine.outputNode.inputFormat(forBus: 0)
            guard format.sampleRate > 0,
                  let buffer = AVAudioPCMBuffer(pcmFormat: format,
                                                frameCapacity: AVAudioFrameCount(format.sampleRate)) else {
                throw NSError(domain: "BackgroundAudio", code: 1,
                              userInfo: [NSLocalizedDescriptionKey: "no usable output format"])
            }
            buffer.frameLength = buffer.frameCapacity  // zero-filled: one second of silence
            engine.attach(player)
            engine.connect(player, to: engine.mainMixerNode, format: format)
            engine.mainMixerNode.outputVolume = 0
            try engine.start()
            player.scheduleBuffer(buffer, at: nil, options: .loops)
            player.play()
            self.engine = engine
            self.player = player
            AppLog.write("background keep-alive: on for \(reason) (silent audio session)")
        } catch {
            AppLog.write("background keep-alive: could not start for \(reason) — "
                + "\(error.localizedDescription). Keep the app on screen.")
        }
    }

    /// Release one hold; the session stops with the last one. Main thread.
    static func release() {
        guard holders > 0 else { return }
        holders -= 1
        guard holders == 0 else { return }
        player?.stop()
        engine?.stop()
        player = nil
        engine = nil
        try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        AppLog.write("background keep-alive: off")
    }
}
