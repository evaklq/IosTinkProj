//
//  CartViewCell.swift
//  Woa
//
//  Created by evaklq on 2024-04-30.
//

import UIKit

class CartViewCell: BaseViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        infoLabel.textColor = Asset.Colors.cost.color
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func configureCell(with art: Art) {
        artImage.image = art.images[0]
        infoLabel.text = art.cost
        nameLabel.text = art.name
        typeLabel.text = art.type.description
        isLike.value?.isLike = art.isLike
        isInCart.value?.isInCart = art.isInCart
        likeButton?.isSelected = art.isLike
        cartButton?.isSelected = art.isInCart
    }
}
