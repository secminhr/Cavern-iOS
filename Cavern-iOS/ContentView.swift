import SwiftUI

struct ContentView: View {
    let list: [ArticlePreview]
    
    var body: some View {
        if (list.isEmpty) {
            ProgressView("Loading articles")
        } else {
            ArticlePreviewList(previews: list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(list: articlePreviewResponseSample.posts)
            ContentView(list: [])
        }
    }
}
