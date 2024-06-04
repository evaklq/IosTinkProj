//
//  SculpturesDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class SculpturesDataSourse: NSObject, UICollectionViewDataSource {
    private var sculptures: [Art] = [
        /*
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, author: "Pushkin", country: "Russia", description: "Cool", isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true),
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, author: "Pushkin", country: "Russia", description: "Cool", isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true)
         */
    ]

    func updateSculptures(_ sculptures: [Art]) {
        self.sculptures = sculptures
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sculptures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = ArtsStoreViewCell.reuseIdentifier
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath) as? ArtsStoreViewCell else { return UICollectionViewCell() }

        let art = sculptures[indexPath.row]
        cell.configureCell(with: art)
        cell.collectionView = collectionView
        return cell
    }
}
