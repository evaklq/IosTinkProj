//
//  TabBarViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class TabBarViewController: UITabBarController, TabBarDelegateProtocol {
    // MARK: - Declaration objects
    var onViewDidAppear: ((UINavigationController) -> Void)?
    var onFamousArtsFlowSelect: ((UINavigationController) -> Void)?
    var onArtsStoreFlowSelect: ((UINavigationController) -> Void)?
    var onCartFlowSelect: ((UINavigationController) -> Void)?
    var onProfileFlowSelect: ((UINavigationController) -> Void)?

    // MARK: - Load view
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidAppear?(controller)
        }
    }
}

// MARK: - Tab Bar Delegate
extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }

        switch selectedIndex {
        case 0:
            onFamousArtsFlowSelect?(controller)
        case 1:
            onArtsStoreFlowSelect?(controller)
        case 2:
            onCartFlowSelect?(controller)
        case 3:
            onProfileFlowSelect?(controller)
        default:
            print("No screen with selected index")
        }
    }
}

// MARK: - Configure UI
extension TabBarViewController {
    private func configureUI() {
        let houseImage = Asset.Assets.house.image
        let shopImage = Asset.Assets.shop.image
        let cartImage = Asset.Assets.cart.image
        let userImage = Asset.Assets.user.image

        let viewControllers = [
            createController(houseImage),
            createController(shopImage),
            createController(cartImage),
            createController(userImage)
        ]

        setViewControllers(viewControllers, animated: true)
        tabBar.unselectedItemTintColor = Asset.Colors.icons.color
        tabBar.tintColor = Asset.Colors.selectedIcons.color
        view.backgroundColor = Asset.Colors.back.color
    }

    private func createController(_ image: UIImage) -> UINavigationController {
        let navigationController = UINavigationController()
        let selectedTintColor = Asset.Colors.selectedIcons.color
        let tintColor = Asset.Colors.icons.color
        navigationController.tabBarItem.image = image.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        navigationController.tabBarItem.selectedImage = image.withTintColor(selectedTintColor, renderingMode: .alwaysOriginal)

        return navigationController
    }
}
