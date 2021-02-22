//
//  ArticleInfo.swift
//  Cavern-iOS
//
//  Created by secminhr on 2021/2/21.
//

import SwiftUI

struct ArticleInfo: View {
    let article: Article
    let onUserClick: () -> Void
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 5) {
                Button(action:onUserClick, label: {
                    Text(article.name)
                        .font(.subheadline)
                })
            }
            Spacer()
            
            Image(systemName: article.islike ? "heart.fill" : "heart")
            Text(article.likes_count)
        }.padding()
    }
}

struct ArticleInfo_Previews: PreviewProvider {
    static var previews: some View {
        ArticleInfo(article: articleResponseSample.post, onUserClick: {})
    }
}
