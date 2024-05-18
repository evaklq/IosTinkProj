//
//  PhotosDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class PhotosDataSourse: NSObject, UICollectionViewDataSource {
    private var photos: [Art] = [
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, isLike: true, isInCart: true, cost: "1000"),
        Art(type: .graphic, images: [Asset.Assets.example.image], name: "Name", year: 2002, isLike: false, cost: 2000),
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, isLike: true, isInCart: true, cost: "1000"),
        Art(type: .graphic, images: [Asset.Assets.example.image], name: "Name", year: 2002, isLike: false, cost: 2000)
    ]

    func updatePhotos(_ photos: [Art]) {
        self.photos = photos
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = ArtsStoreViewCell.reuseIdentifier
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? ArtsStoreViewCell
        else { return UICollectionViewCell() }

        let art = photos[indexPath.row]
        cell.configureCell(with: art)
        cell.collectionView = collectionView
        return cell
    }
}
