//
//  CartDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-04-30.
//

import UIKit

class CartDataSourse: NSObject {
    private var artsInCart: [Art] = [
        Art(type: .artObject, image: Asset.Assets.example.image, name: "Name", year: 2005, isLike: true, isInCart: true, cost: "1000"),
        Art(type: .graphics, image: Asset.Assets.example.image, name: "Name", year: 2002, isLike: false, isInCart: true, cost: 2000)
    ]

    func updateArts(_ arts: [Art]) {
        artsInCart = arts.filter { $0.isInCart }
    }
}

extension CartDataSourse: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        artsInCart.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartViewCell.reuseIdentifier, for: indexPath) as? CartViewCell
        else { return UITableViewCell() }

        let art = artsInCart[indexPath.section]

        if art.isInCart {
            cell.configureCell(with: art)
        } else {
            return UITableViewCell()
        }

        cell.table = tableView
        return cell
    }
}
