//
//  Art.swift
//  Woa
//
//  Created by evaklq on 2024-04-17.
//

import UIKit

class Art {
    var images: [UIImage]
    var year: Int?
    var stringYear: String
    var name: String
    var type: ArtType
    var isLike: Bool
    var isInCart: Bool
    var cost: String

    init(type: ArtType, images: [UIImage], name: String, year: Int?, isLike: Bool = false, isInCart: Bool = false, cost: Double = 0) {
        self.images = images
        self.year = year
        self.stringYear = (year?.description ?? "no ") + Strings.Title.year
        self.name = name
        self.type = type
        self.isLike = isLike
        self.isInCart = isInCart
        self.cost = Strings.Title.cost + cost.description
    }

    init(type: ArtType, images: [UIImage], name: String, year: Int?, isLike: Bool = false, isInCart: Bool = false, cost: String = "") {
        self.images = images
        self.year = year
        self.stringYear = (year?.description ?? "no ") + Strings.Title.year
        self.name = name
        self.type = type
        self.isLike = isLike
        self.isInCart = isInCart
        self.cost = Strings.Title.cost + cost
    }
}
