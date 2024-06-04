//
//  ArchiveArtsDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-19.
//

import UIKit

class ArchiveArtsDataSourse: NSObject {
    private var userArts: [Art] = [
        Art(type: .artObject, images: [Asset.Assets.example1.image], name: "Name", year: 2023, isLike: true, isInCart: true, cost: "1000", isSelling: false, isSelled: true),
        Art(type: .artObject, images: [Asset.Assets.example2.image], name: "Name", year: 2022, isLike: true, isInCart: true, cost: "3000", isSelling: false, isSelled: true)
    ]

    func updateArts(_ arts: [Art]) {
        userArts = arts.filter { !$0.isSelling }
    }
}

extension ArchiveArtsDataSourse: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        userArts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserArtsViewCell.reuseIdentifier, for: indexPath) as? UserArtsViewCell
        else { return UITableViewCell() }

        let art = userArts[indexPath.section]
        cell.configureCell(with: art)
        cell.table = tableView
        return cell
    }
}


