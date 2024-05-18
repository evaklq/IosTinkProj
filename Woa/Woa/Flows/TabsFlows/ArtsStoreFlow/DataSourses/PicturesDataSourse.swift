//
//  PicturesDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class PicturesDataSourse: NSObject, UICollectionViewDataSource {
    private var pictures: [Art] = [
        Art(type: .artObject, image: Asset.Assets.example.image, name: "Name", year: 2005, isLike: true, isInCart: true, cost: "1000"),
        Art(type: .graphics, image: Asset.Assets.example.image, name: "Name", year: 2002, isLike: false, cost: 2000),
        Art(type: .graphics, image: Asset.Assets.example.image, name: "Name", year: 2002, isLike: false, cost: 2000),
        Art(type: .graphics, image: Asset.Assets.example.image, name: "Name", year: 2002, isLike: false, cost: 2000)
    ]

    func updatePictures(_ pictures: [Art]) {
        self.pictures = pictures
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtsStoreViewCell.reuseIdentifier, for: indexPath) as? ArtsStoreViewCell
        else { return UICollectionViewCell() }

        let art = pictures[indexPath.row]
        cell.configureCell(with: art)
        cell.collectionView = collectionView
        return cell
    }
}
