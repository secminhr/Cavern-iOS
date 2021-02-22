import SwiftUI

struct ArticlePreviewList: View {
    let previews: [ArticlePreview]
    
    var body: some View {
        NavigationView {
            List(previews, id: \.pid) { preview in
                NavigationLink(
                    destination: ArticleView(id: preview.pid),
                    label: {
                        ArticlePreviewRow(preview: preview)
                    })
            }
            .navigationTitle("Articles")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ArticlePreviewList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArticlePreviewList(previews: articlePreviewResponseSample.posts)
            ArticlePreviewList(previews: articlePreviewResponseSample.posts)
                .previewDevice("iPhone 12")
        }
    }
}
