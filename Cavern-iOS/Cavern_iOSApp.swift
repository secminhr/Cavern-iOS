import SwiftUI
import Combine

@main
struct Cavern_iOSApp: App {
    @State var posts: [ArticlePreview] = []
    
    var body: some Scene {
        WindowGroup {
            ContentView(list: posts)
                .onReceive(articlesPublisher, perform: {
                    posts.append(contentsOf: $0)
                })
        }
    }
}
