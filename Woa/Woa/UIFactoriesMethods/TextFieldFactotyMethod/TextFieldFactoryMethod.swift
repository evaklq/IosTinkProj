//
//  TextFieldFactoryMethod.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

final class TextFieldFactoryMethod: TextFieldFactoryMethodProtocol {
    func createTextField(placeholder: String, action: UIAction?, type: TextFieldType) -> UITextField {
        switch type {
        case .default:
            createBaseTextField(placeholder)
        case .search:
            createSearchTextField(placeholder, action)
        }
    }
}

private extension TextFieldFactoryMethod {
    func createSearchTextField(_ placeholder: String, _ action: UIAction?) -> UITextField {
        let textField = createBaseTextField(placeholder, Asset.Colors.backDecor.color.cgColor)

        let buttonContainer = UIView(frame: CGRect(x: 0, y: 0, width: 37, height: 20))

        let searchButton = createCustomButton(action: action)
        searchButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        buttonContainer.addSubview(searchButton)

        textField.rightView = buttonContainer
        textField.rightViewMode = .always
        return textField
    }

    func createBaseTextField(_ placeholder: String, _ backColor: CGColor = Asset.Colors.back.color.cgColor) -> UITextField {
        let textField = UITextField()
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 17, height: 1))
        let placeholderAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: Asset.Colors.placeholder.color]
        let attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeholderAttributes)

        textField.attributedPlaceholder = attributedPlaceholder
        textField.textColor = Asset.Colors.textFieldText.color
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        textField.layer.backgroundColor = backColor
        textField.layer.cornerRadius = 15

        return textField
    }
}

private extension TextFieldFactoryMethod {
    func createCustomButton(action: UIAction?) -> UIButton {
        let searchButton = UIButton(type: .custom)
        if let action = action {
            let color = Asset.Colors.textFieldText.color
            let image = Asset.Assets.findIcon.image.withTintColor(color)
            searchButton.setImage(image, for: .normal)
            searchButton.addAction(action, for: .touchUpInside)
        }
        return searchButton
    }
}
