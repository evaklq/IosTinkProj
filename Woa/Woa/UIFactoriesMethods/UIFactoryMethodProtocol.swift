//
//  File.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

protocol UIFactoryMethodProtocol {
    func createButton(type: ButtonType, action: UIAction?, title: String?, isLike: Bool?, isInCart: Bool?, isSelling: Bool?, isSelled: Bool?) -> UIButton
    func createLabel(type: LabelType, text: String?, size: Int?) -> UILabel
    func createTextField(type: TextFieldType, placeholder: String, action: UIAction?) -> UITextField
    func createAlert(type: AlertType, message: String) -> UIAlertController
}
