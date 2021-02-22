import Foundation

struct User: Decodable {
    let username: String
    let name: String
    let role: String
    let hash: String
    let posts_count: Int
    
    private enum CodingKeys: String, CodingKey {
        case username
        case name
        case role
        case hash
        case posts_count
    }
    
    var type = UserType.normal
    
    static let Error = User(username: "", name: "", role: "", hash: "", posts_count: -1, type: .error)
}

enum UserType {
    case normal
    case error
}

var sampleUser: User = load("UserSample.json")
