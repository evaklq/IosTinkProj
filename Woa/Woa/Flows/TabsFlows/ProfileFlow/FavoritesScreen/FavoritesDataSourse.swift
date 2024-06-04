//
//  FavoritesDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import UIKit

class FavoritesDataSourse: NSObject {
    private var favoriteArts: [Art] = [
        Art(type: .graphic, images: [Asset.Assets.example2.image], name: "Atmosphere", year: 2002, isLike: true, isInCart: true, cost: 6000)
    ]

    func updateArts(_ arts: [Art]) {
        favoriteArts = arts
    }
}

extension FavoritesDataSourse: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        favoriteArts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseViewCell.reuseIdentifier, for: indexPath) as? BaseViewCell
        else { return UITableViewCell() }

        let art = favoriteArts[indexPath.section]
        cell.configureCell(with: art)
        cell.table = tableView
        return cell
    }
}

