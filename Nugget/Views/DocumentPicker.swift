import SwiftUI
import UIKit
import UniformTypeIdentifiers

/// A real `UIDocumentPickerViewController`, presented from a sheet.
///
/// Why not SwiftUI's `.fileImporter`: every tab of the phone `TabView` stays
/// alive, and the home (pairing files), Tweaks (.json), PosterBoard (.data,
/// video, image), Files, Presets and Passcode pages each attach their own
/// `.fileImporter`. SwiftUI drives one shared importer, so which page's
/// `allowedContentTypes` the picker opens with is not reliably the page that
/// asked. A `.batter` import that opened with another page's types greyed the
/// file out even though Templates asks for `.item`. This controller is owned by
/// the sheet that presents it, so its types are exactly the ones passed here.
///
/// `asCopy: true` hands back a copy in the app's own tmp inbox: no security
/// scope to start or lose, and third-party File Providers that never assigned
/// `.batter` a type still return a readable file.
struct DocumentPicker: UIViewControllerRepresentable {
    let contentTypes: [UTType]
    let onPick: (Result<URL, Error>) -> Void
    @Environment(\.dismiss) private var dismiss

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(
            forOpeningContentTypes: contentTypes.isEmpty ? [.item] : contentTypes, asCopy: true)
        picker.allowsMultipleSelection = false
        picker.shouldShowFileExtensions = true
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ controller: UIDocumentPickerViewController, context: Context) {
        context.coordinator.parent = self
    }

    @MainActor
    final class Coordinator: NSObject, UIDocumentPickerDelegate {
        var parent: DocumentPicker
        init(_ parent: DocumentPicker) { self.parent = parent }

        func documentPicker(_ controller: UIDocumentPickerViewController,
                            didPickDocumentsAt urls: [URL]) {
            let parent = self.parent
            parent.dismiss()
            if let url = urls.first {
                parent.onPick(.success(url))
            } else {
                parent.onPick(.failure(CocoaError(.fileNoSuchFile)))
            }
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            parent.dismiss()
        }
    }
}

extension View {
    /// `.fileImporter`'s shape, backed by `DocumentPicker`. `contentTypes` is
    /// read when the sheet opens, so a page can switch types between uses.
    func documentPicker(isPresented: Binding<Bool>,
                        contentTypes: @escaping () -> [UTType],
                        onPick: @escaping (Result<URL, Error>) -> Void) -> some View {
        sheet(isPresented: isPresented) {
            DocumentPicker(contentTypes: contentTypes(), onPick: onPick)
                .ignoresSafeArea()
        }
    }
}
