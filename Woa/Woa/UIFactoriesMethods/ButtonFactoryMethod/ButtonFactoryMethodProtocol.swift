//
//  ButtonFactoryMethodProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

enum ButtonType {
    case `default`, text, like, cart
}

protocol ButtonFactoryMethodProtocol {
    func createButton(type: ButtonType, action: UIAction?, title: String?, isLike: Bool?, isInCart: Bool?) -> UIButton
}
