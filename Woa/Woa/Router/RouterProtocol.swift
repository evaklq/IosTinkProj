//
//  RouterProtocol.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

protocol RouterProtocol {
    func present(_ controller: UIViewController, animated: Bool)

    func push(_ controller: UIViewController, animated: Bool)

    func pop(animated: Bool)
    func popToRootController(animated: Bool)

    func dismiss(animated: Bool)

    func setRootController(_ controller: UIViewController, isNavigationBarHidden: Bool)
}
