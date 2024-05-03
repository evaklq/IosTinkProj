//
//  SculpturesDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class SculpturesDataSourse: NSObject, UICollectionViewDataSource {
    private var sculptures: [Art] = [
        Art(type: .artObject, image: Asset.Assets.example.image, name: "Name", year: 2005, isLike: true, isInCart: true, cost: "1000"),
        Art(type: .graphics, image: Asset.Assets.example.image, name: "Name", year: 2002, isLike: false, cost: 2000)
    ]

    func updateSculptures(_ sculptures: [Art]) {
        self.sculptures = sculptures
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sculptures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtsStoreViewCell.reuseIdentifier, for: indexPath) as? ArtsStoreViewCell else { return UICollectionViewCell() }

        let art = sculptures[indexPath.row]
        cell.configureCell(with: art)
        cell.collectionView = collectionView
        return cell
    }
}
