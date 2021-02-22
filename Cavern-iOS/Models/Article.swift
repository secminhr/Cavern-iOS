import Foundation

struct ArticleResposne: Decodable {
    let post: Article
}

struct Article: Decodable {
    let author: String
    let name: String
    let title: String
    let content: String
    let time: Date
    let likes_count: String
    let comments_count: String
    let islike: Bool
    
    private enum CodingKeys: String, CodingKey {
        case author
        case name
        case title
        case content
        case time
        case likes_count
        case comments_count
        case islike
    }
    
    var type: ArticleType = .normal
    static let Error = Article(author: "", name: "", title: "", content: "", time: Date(), likes_count: "", comments_count: "", islike: false, type: .error)
}

enum ArticleType {
    case normal
    case error
}

var articleResponseSample: ArticleResposne = load("ArticleSample.json")
