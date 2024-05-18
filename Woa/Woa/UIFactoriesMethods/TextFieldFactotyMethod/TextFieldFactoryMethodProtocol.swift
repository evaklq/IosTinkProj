//
//  TextFieldFactoryMethodProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

enum TextFieldType {
    case `default`, search
}

protocol TextFieldFactoryMethodProtocol {
    func createTextField(placeholder: String, action: UIAction?, type: TextFieldType) -> UITextField
}
