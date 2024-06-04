//
//  PicturesDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class PicturesDataSourse: NSObject, UICollectionViewDataSource {
    private var pictures: [Art] = [
        /*
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, author: "Pushkin", country: "Russia", description: "Cool", isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true),
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, author: "Pushkin", country: "Russia", description: "Cool", isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true)
         */
    ]

    func updatePictures(_ pictures: [Art]) {
        self.pictures = pictures
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = ArtsStoreViewCell.reuseIdentifier
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ArtsStoreViewCell
        else { return UICollectionViewCell() }

        let art = pictures[indexPath.row]
        cell.configureCell(with: art)
        cell.collectionView = collectionView
        return cell
    }
}
