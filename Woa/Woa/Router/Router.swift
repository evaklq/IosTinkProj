//
//  Router.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

final class Router: RouterProtocol {
    private var rootController: UINavigationController?

    init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    func present(_ controller: UIViewController, animated: Bool) {
        rootController?.present(controller, animated: animated)
    }

    func push(_ controller: UIViewController, animated: Bool) {
        configureNavBar()
        rootController?.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool) {
        rootController?.popViewController(animated: animated)
    }

    func popToRootController(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
    }

    func dismiss(animated: Bool) {
        rootController?.dismiss(animated: animated)
    }

    func setRootController(_ controller: UIViewController, isNavigationBarHidden: Bool = false) {
        configureNavBar()
        rootController?.isNavigationBarHidden = isNavigationBarHidden
        rootController?.setViewControllers([controller], animated: false)
    }

    func presenter() -> UINavigationController? {
        return rootController
    }

    private func configureNavBar() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.rootController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.rootController?.navigationBar.tintColor = Asset.Colors.general.color
    }
}
