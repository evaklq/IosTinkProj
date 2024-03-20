//
//  TabBarViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class TabBarViewController: UITabBarController, TabBarDelegateProtocol {
    var onViewDidAppear: ((UINavigationController) -> Void)?
    var onFamousArtsFlowSelect: ((UINavigationController) -> Void)?
    var onArtsStoreFlowSelect: ((UINavigationController) -> Void)?
    var onCartFlowSelect: ((UINavigationController) -> Void)?
    var onProfileFlowSelect: ((UINavigationController) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidAppear?(controller)
        }
    }
}
