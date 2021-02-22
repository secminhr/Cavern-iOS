import Combine
import Foundation
import SwiftUI

//MARK: articles section
var articlesPublisher: AnyPublisher<[ArticlePreview], Never> = {
    let pass = CurrentValueSubject<Int, Never>(1)

    return pass
        .flatMap { loadArticle(page: $0) }
        .removeDuplicates(by: { old, new in
            return old.2 == new.2
        })
        .handleEvents(receiveOutput: { (previews, hasNext, currentPage) in
            if hasNext {
                pass.send(currentPage+1)
            }
        })
        .map(\.0)
        .eraseToAnyPublisher()
}()

private func loadArticle(page: Int) -> AnyPublisher<([ArticlePreview], Bool, Int), Never> {
    return URLSession.DataTaskPublisher(request: URLRequest(url: URL(string: "https://stoneapp.tech/cavern/ajax/posts.php?page=\(page)")!), session: .shared)
        .retry(2)
        .map(\.data)
        .decode(type: ArticlePreviewResponse.self, decoder: CavernJsonDecoder)
        .map(\.posts, \.hasNextPage, \.page)
        .replaceError(with: ([], false, page))
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
}


//MARK: article content section
func articlePublisher(id: Int) -> AnyPublisher<Article, Never> {
    let request = URLRequest(url: URL(string: "https://stoneapp.tech/cavern/ajax/posts.php?pid=\(id)")!)
    return URLSession.DataTaskPublisher(request: request, session: .shared)
        .retry(2)
        .map(\.data)
        .decode(type: ArticleResposne.self, decoder: CavernJsonDecoder)
        .map(\.post)
        .receive(on: DispatchQueue.main)
        .replaceError(with: Article.Error)
        .eraseToAnyPublisher()
}

//MARK: user info section
func userInfoPublisher(username: String) -> AnyPublisher<User, Never> {
    let request = URLRequest(url: URL(string: "https://stoneapp.tech/cavern/ajax/user.php?username=\(username)")!)
    return URLSession.DataTaskPublisher(request: request, session: .shared)
        .retry(2)
        .map(\.data)
        .decode(type: User.self, decoder: CavernJsonDecoder)
        .receive(on: DispatchQueue.main)
        .replaceError(with: User.Error)
        .eraseToAnyPublisher()
}

func imagePublisher(hash: String) -> AnyPublisher<Image, Never> {
    let request = URLRequest(url: URL(string: "https://www.gravatar.com/avatar/\(hash)?d=https%3A%2F%2Ftocas-ui.com%2Fassets%2Fimg%2F5e5e3a6.png&s=500")!)
    
    return URLSession.DataTaskPublisher(request: request, session: .shared)
        .retry(2)
        .map(\.data)
        .map { Image(uiImage: UIImage(data: $0)!) }
        .replaceError(with: Image(systemName: "person.circle"))
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
}
