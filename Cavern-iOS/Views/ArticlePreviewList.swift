import SwiftUI

struct ArticlePreviewList: View {
    let previews: [ArticlePreview]
    
    var body: some View {
        List(previews, id: \.pid) {
            ArticlePreviewRow(preview: $0)
        }
    }
}

struct ArticlePreviewList_Previews: PreviewProvider {
    static var previews: some View {
        ArticlePreviewList(previews: articlePreviewResponseSample.posts)
    }
}
