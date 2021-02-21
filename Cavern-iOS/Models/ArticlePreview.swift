import Foundation

struct ArticlePreviewResponse: Codable {
    let page_limit: Int
    let page: Int
    let all_posts_count: Int
    var hasNextPage: Bool {
        page_limit * page < all_posts_count
    }
    
    let posts: [ArticlePreview]
}

struct ArticlePreview: Codable {
    let author: String
    let name: String
    let pid: Int
    let title: String
    let time: Date
    let likes_count: String
    let comments_count: String
    let islike: Bool
}


var articlePreviewSample: ArticlePreview = load("ArticlePreviewSample.json")
var articlePreviewResponseSample: ArticlePreviewResponse = load("ArticlesSample.json")
