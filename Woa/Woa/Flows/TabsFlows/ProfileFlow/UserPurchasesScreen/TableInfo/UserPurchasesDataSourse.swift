//
//  UserPurchasesDataSourse.swift
//  Woa
//
//  Created by evaklq on 2024-05-22.
//

import UIKit

class UserPurchasesDataSourse: NSObject {
    private var purchasesOrders: [Order] = [
        Order(art: Art(type: .graphic, images: [Asset.Assets.example2.image], name: "Atmosphere", year: 2002, isLike: false, cost: 6000), buyer: UserData(nick: "nick", email: "email", age: 7, icon: nil, id: "id"), status: .placed, dateOfOrder: Date()),
    ]

    func updateOrders(_ orders: [Order]) {
        purchasesOrders = orders
    }
}

extension UserPurchasesDataSourse: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        purchasesOrders.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserPurchasesViewCell.reuseIdentifier, for: indexPath) as? UserPurchasesViewCell
        else { return UITableViewCell() }

        let order = purchasesOrders[indexPath.section]

        cell.configureCell(with: order)

        cell.table = tableView
        return cell
    }
}

