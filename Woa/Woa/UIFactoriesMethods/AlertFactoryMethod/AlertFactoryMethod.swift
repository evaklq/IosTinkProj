//
//  AlertFactoryMethod.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit

final class AlertFactoryMethod: AlertFactoryMethodProtocol {
    func createAlert(message: String, type: AlertType) -> UIAlertController {
        switch type {
        case .error:
            createErrorAlert(message)
        }
    }
}

private extension AlertFactoryMethod {
    func createErrorAlert(_ message: String) -> UIAlertController {
        let title = Strings.Error.Alert.signup
        let action = Strings.Alert.ok
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default))

        return alert
    }
}
