//
//  FamousArtsDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-04-30.
//

import UIKit

class FamousArtsDataSourse: NSObject {
    private var famousArts: [Art] = [
        Art(type: .artObject, images: [Asset.Assets.example.image], name: "Name", year: 2005, isLike: true, isInCart: true, cost: "1000"),
        Art(type: .graphic, images: [Asset.Assets.example.image], name: "Name", year: 2002, isLike: false, cost: 2000)
    ]

    func updateArts(_ arts: [Art]) {
        famousArts = arts
    }
}

extension FamousArtsDataSourse: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        famousArts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseViewCell.reuseIdentifier, for: indexPath) as? BaseViewCell
        else { return UITableViewCell() }

        let art = famousArts[indexPath.section]
        cell.configureCell(with: art)
        cell.table = tableView
        return cell
    }
}
