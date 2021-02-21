import Combine
import Foundation

var articlesPublisher: AnyPublisher<[ArticlePreview], Never> = {
    let pass = CurrentValueSubject<Int, Never>(1)

    return pass
        .flatMap { loadArticle(page: $0) }
        .removeDuplicates(by: { old, new in
            return old.2 == new.2
        })
        .handleEvents(receiveOutput: { (previews, hasNext, currentPage) in
            print(previews)
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
