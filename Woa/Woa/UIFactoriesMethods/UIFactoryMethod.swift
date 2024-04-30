//
//  UIFactoryMethod.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

final class UIFactoryMethod: UIFactoryMethodProtocol {
    private let buttonFactoryMethod = ButtonFactoryMethod()
    private let labelFactoryMethod = LabelFactoryMethod()
    private let textFieldFactoryMethod = TextFieldFactoryMethod()
    private let alertFactoryMethod = AlertFactoryMethod()

    func createButton(type: ButtonType, action: UIAction? = nil, title: String? = nil, isLike: Bool? = nil) -> UIButton {
        buttonFactoryMethod.createButton(type: type, action: action, title: title, isLike: isLike)
    }
    func createLabel(type: LabelType, text: String? = nil, size: Int? = nil) -> UILabel {
        labelFactoryMethod.createLabel(text: text, size: size, type: type)
    }
    func createTextField(type: TextFieldType, placeholder: String, action: UIAction? = nil) -> UITextField {
        textFieldFactoryMethod.createTextField(placeholder: placeholder, action: action, type: type)
    }
    func createAlert(type: AlertType, message: String) -> UIAlertController {
        alertFactoryMethod.createAlert(message: message, type: type)
    }
}
