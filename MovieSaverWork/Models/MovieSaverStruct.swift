import Foundation

import UIKit

struct MovieInfo {
    var name: String = ""
    var rating: String = ""
    var releaseDate: String = ""
    var youtubeLink: URL = URL(string: "https://www.youtube.com/watch?v=V0hagz_8L3M")!
    var description: String = ""
    var imageMovie: UIImage = UIImage(named: "NoneImage")!
}

//public protocol ImageCodable: Codable {}
//extension UIImage: ImageCodable {}
//
//extension ImageCodable where Self: UIImage {
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        self.init(data: try container.decode(Data.self))!
//    }
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encode(self.pngData()!)
//    }
//}

