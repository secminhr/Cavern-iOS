import Foundation

var CavernDateFomatter: DateFormatter = {
    let format = DateFormatter()
    format.locale = Locale(identifier: "en_US")
    format.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return format
}()

var CavernJsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(CavernDateFomatter)
    return decoder
}()


func load<T: Decodable>(_ filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Creating sample article preview failed")
    }
    let data: Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Creating sample article preview failed")
    }
    
    return load(data)
}

func load<T: Decodable>(_ data: Data) -> T {
    do {
        return try CavernJsonDecoder.decode(T.self, from: data)
    } catch {
        fatalError("Creating sample article preview failed")
    }
}
