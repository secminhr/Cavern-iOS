import SwiftUI

@main
struct Cavern_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(list: articlePreviewResponseSample.posts)
        }
    }
}
