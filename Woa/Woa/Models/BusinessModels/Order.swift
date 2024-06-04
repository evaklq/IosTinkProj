//
//  Order.swift
//  Woa
//
//  Created by evaklq on 2024-05-22.
//

import Foundation

class Order: Art {
    var buyer: UserData
    var status: OrderStatus
    var dateOfOrder: Date

    init(art: Art, buyer: UserData, status: OrderStatus, dateOfOrder: Date) {
        self.buyer = buyer
        self.status = status
        self.dateOfOrder = dateOfOrder
        super.init(type: art.type, images: art.images, name: art.name, year: art.year, isLike: art.isLike, isInCart: art.isInCart, cost: art.cost, isSelling: false, isSelled: true)
    }
}
