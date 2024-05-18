//
//  LabelFactoryMethodProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

enum LabelType {
    case `default`, title, error
}

protocol LabelFactoryMethodProtocol {
    func createLabel(text: String?, size: Int?, type: LabelType) -> UILabel
}
