//
//  ButtonFactoryMethod.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

final class ButtonFactoryMethod: ButtonFactoryMethodProtocol {
    func createButton(type: ButtonType, action: UIAction?, title: String?, isLike: Bool?, isInCart: Bool?, isSelling: Bool?, isSelled: Bool?) -> UIButton {
        switch type {
        case .default:
            createDefaultButton(title, action)
        case .text:
            getBaseButton(title, action)
        case .like:
            createLikeButton(action, isLike)
        case .cart:
            createCartButton(action, isInCart)
        case .arcive:
            createArchiveButton(action, isSelling, isSelled)
        }
    }
}

private extension ButtonFactoryMethod {
    func createDefaultButton(_ title: String?, _ action: UIAction?) -> UIButton {
        let button = getBaseButton(title, action, weight: .bold)
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1.5

        return button
    }

    func createLikeButton(_ action: UIAction?, _ isLike: Bool?) -> UIButton {
        let button = UIButton()
        let imageUnselected = Asset.Assets.likeUnselected.image
        let imageSelected = Asset.Assets.likeSelected.image
        guard let action else { return button }

        button.addAction(action, for: .touchUpInside)
        button.setImage(imageUnselected, for: .normal)
        button.setImage(imageSelected, for: .selected)

        if let isLike = isLike {
            button.isSelected = isLike
        } else {
            button.isSelected = false
        }

        return button
    }

    func createCartButton(_ action: UIAction?, _ isInCart: Bool?) -> UIButton {
        let button = UIButton()
        let imageUnselected = Asset.Assets.cartS.image
        let imageSelected = Asset.Assets.cartSelected.image
        guard let action else { return button }

        button.addAction(action, for: .touchUpInside)
        button.setImage(imageUnselected, for: .normal)
        button.setImage(imageSelected, for: .selected)

        if let isInCart = isInCart {
            button.isSelected = isInCart
        } else {
            button.isSelected = false
        }

        return button
    }

    func createArchiveButton(_ action: UIAction?, _ isSelling: Bool?, _ isSelled: Bool?) -> UIButton {
        let button = UIButton()
        let imageUnselected = Asset.Assets.unarchive.image
        let imageSelected = Asset.Assets.archive.image

        if !(isSelled ?? true) {
            guard let action else { return button }
            button.addAction(action, for: .touchUpInside)
            button.setImage(imageUnselected, for: .normal)
            button.setImage(imageSelected, for: .selected)

            if let isSelling = isSelling {
                button.isSelected = isSelling
            } else {
                button.isSelected = false
            }
        } else {
            button.setTitle("Sell", for: .normal)
            button.backgroundColor = UIColor.clear
            button.layer.borderColor = Asset.Colors.general.color.cgColor
            button.setTitleColor(Asset.Colors.profileItems.color, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(20), weight: .bold)
        }

        return button
    }

    func getBaseButton(_ title: String?, _ action: UIAction?, size: Int = 14, weight: UIFont.Weight = .regular) -> UIButton {
        let button = UIButton()
        guard let action else { return button }
        guard let title else { return button }

        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor.clear
        button.addAction(action, for: .touchUpInside)
        button.layer.borderColor = Asset.Colors.general.color.cgColor
        button.setTitleColor(Asset.Colors.general.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)

        return button
    }
}
