//
//  ArticlePreviewRow.swift
//  Cavern-iOS
//
//  Created by secminhr on 2021/2/20.
//

import SwiftUI

struct ArticlePreviewRow: View {
    let preview: ArticlePreview
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(preview.title)
                    .font(.title2)
                Text(preview.name)
                    .font(.subheadline)
                Text(CavernDateFomatter.string(from: preview.time))
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Image(systemName: preview.islike ? "heart.fill" : "heart")
            Text(preview.likes_count)
        }.padding()
    }
}

struct ArticlePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        ArticlePreviewRow(preview: articlePreviewResponseSample.posts[0])
        
        ArticlePreviewRow(preview: articlePreviewResponseSample.posts[1])
        }.previewLayout(.fixed(width: 700, height: 100))
    }
}
