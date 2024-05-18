//
//  ArtDto.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import Foundation

struct ArtDto: Decodable {
    var isSelling: Bool
    var title: String
    var rating: Int
    var cost: Double
    var description: String
    var dateCreated: Date?
    var artCategory: ArtCategoryDto
    var author: AuthorDto
    var location: LocationDto
    var images: [ImageDto]
    var tags: [TagDto]
}
