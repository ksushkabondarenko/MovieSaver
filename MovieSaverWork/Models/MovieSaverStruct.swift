
import Foundation

import UIKit

struct MovieInfo {
    internal init(name: String, rating: String, releaseDate: String, youtubeLink: URL, description: String, imageMovie: UIImage) {
        self.name = name
        self.rating = rating
        self.releaseDate = releaseDate
        self.youtubeLink = youtubeLink
        self.description = description
        self.imageMovie = imageMovie
    }
    
    init() {
        self.name = ""
        self.rating = ""
        self.releaseDate = ""
        self.youtubeLink = URL(string: "https://www.youtube.com/watch?v=JfVOs4VSpmA")!
        self.description = ""
        self.imageMovie = UIImage(named: "pictureImage")!
    }
    
    var name: String
    var rating: String
    var releaseDate: String
    var youtubeLink: URL
    var description: String
    var imageMovie: UIImage
}
