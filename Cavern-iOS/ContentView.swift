import SwiftUI

struct ContentView: View {
    let list: [ArticlePreview]
    
    var body: some View {
        ArticlePreviewList(previews: list)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(list: articlePreviewResponseSample.posts)
    }
}
