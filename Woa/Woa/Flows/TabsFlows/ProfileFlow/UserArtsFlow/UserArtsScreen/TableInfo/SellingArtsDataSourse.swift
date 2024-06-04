//
//  SellingArtsDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-19.
//

import UIKit

class SellingArtsDataSourse: NSObject {
    private var sellingArts: [Art] = [
        Art(type: .graphic, images: [Asset.Assets.example3.image], name: "Amort", year: 2002, isLike: false, cost: 2000, isSelling: true, isSelled: false)
    ]

    func updateArts(_ arts: [Art]) {
        sellingArts = arts.filter { $0.isSelling }
    }
}

extension SellingArtsDataSourse: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sellingArts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserArtsViewCell.reuseIdentifier, for: indexPath) as? UserArtsViewCell
        else { return UITableViewCell() }

        let art = sellingArts[indexPath.section]
        cell.configureCell(with: art)
        cell.table = tableView
        return cell
    }
}

