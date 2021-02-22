import SwiftUI

struct ArticleView: View {
    @State var article: Article? = nil
    let id: Int
    @State var viewMode: Int = 0
    @State var showUserInfo = false
    
    var body: some View {
        if article != nil && article!.type == .normal {
            VStack {
                ArticleInfo(article: article!, onUserClick: {
                    withAnimation {
                        showUserInfo.toggle()
                    }
                })
                .sheet(isPresented: $showUserInfo, content: {
                    UserInfo(showing: $showUserInfo, username: article!.author)
                })
                
                if viewMode == 0 {
                    MarkdownView(markdown: article!.content)
                } else {
                    CommentsView()
                }
                Spacer()
            }
            .navigationTitle(article!.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Picker(
                    selection: $viewMode.animation(),
                    label: Text("Picker"),
                    content: {
                        Text("Article").tag(0)
                        Text("Comments").tag(1)
                    }
                )
                .pickerStyle(SegmentedPickerStyle())
            }
        } else {
            ProgressView()
                .onReceive(articlePublisher(id: id), perform: {
                    article = $0
                })
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ArticleView(article: articleResponseSample.post, id: -1)
            }.navigationViewStyle(StackNavigationViewStyle())
            NavigationView {
                ArticleView(article: articleResponseSample.post, id: -1)
            }.previewDevice("iPhone 12")
        }
    }
}
