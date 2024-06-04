//
//  AlertFactoryMethodProtocol.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

enum AlertType {
    case error
}

protocol AlertFactoryMethodProtocol {
    func createAlert(message: String, type: AlertType) -> UIAlertController
}
