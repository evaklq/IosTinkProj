//
//  ArtObjectsDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class ArtObjectsDataSourse: NSObject, UICollectionViewDataSource {
    private var artObjects: [Art] = [
        /*
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, author: "Pushkin", country: "Russia", description: "Cool", isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true),
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, author: "Pushkin", country: "Russia", description: "Cool", isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true)
         */
    ]

    func updateArtObjects(_ artObjects: [Art]) {
        self.artObjects = artObjects
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        artObjects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = ArtsStoreViewCell.reuseIdentifier
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ArtsStoreViewCell
        else { return UICollectionViewCell() }

        let art = artObjects[indexPath.row]
        cell.configureCell(with: art)
        cell.collectionView = collectionView
        return cell
    }
}