import Foundation

struct ArticlePreviewResponse: Codable {
    let page_limit: Int
    let page: Int
    let all_posts_count: Int
    
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

var cavernJSONDecoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(cavernDateFormat)
    return decoder
}

var cavernDateFormat: DateFormatter {
    let format = DateFormatter()
    format.locale = Locale(identifier: "en_US")
    format.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return format
}

var articlePreviewSample: ArticlePreview {
    guard let file = Bundle.main.url(forResource: "ArticlePreviewSample.json", withExtension: nil) else {
        fatalError("Creating sample article preview failed")
    }
    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Creating sample article preview failed")
    }
    
    do {
        return try cavernJSONDecoder.decode(ArticlePreview.self, from: data)
    } catch {
        fatalError("Creating sample article preview failed")
    }
}

var articlePreviewResponseSample: ArticlePreviewResponse {
    guard let file = Bundle.main.url(forResource: "ArticlesSample.json", withExtension: nil) else {
        fatalError("Creating sample article preview failed")
    }
    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Creating sample article preview failed")
    }
    
    do {
        return try cavernJSONDecoder.decode(ArticlePreviewResponse.self, from: data)
    } catch {
        fatalError("Creating sample article preview failed")
    }
}
