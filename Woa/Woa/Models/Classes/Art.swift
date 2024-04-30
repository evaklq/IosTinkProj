//
//  Art.swift
//  Woa
//
//  Created by evaklq on 2024-04-17.
//

import UIKit

class Art {
    var image: UIImage
    var year: Int
    var stringYear: String
    var name: String
    var type: ArtType
    var isLike: Bool

    init( type: ArtType, image: UIImage, name: String, year: Int, isLike: Bool = false) {
        self.image = image
        self.year = year
        self.stringYear = year.description + " year"
        self.name = name
        self.type = type
        self.isLike = isLike
    }
}
