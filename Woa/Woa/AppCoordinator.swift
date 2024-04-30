//
//  AppCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var router: Router
    private let authService = AuthService.shared

    init(router: Router) {
        self.router = router
    }

    // хардкод 0_о
    override func start() {
        if true {
            runAuthFlow()
        } else {
            runTabBarFlow()
        }
    }
}

// MARK: - Configure flows actions
extension AppCoordinator {
    private func runAuthFlow() {
        let authFlowCoordinator = coordinatorFactory.createAuthCoordinator(router: router)
        addDependency(authFlowCoordinator)
        authFlowCoordinator.flowCompletionHandler = { [weak self] in
            self?.runTabBarFlow()
            self?.removeDependency(authFlowCoordinator)
        }
        authFlowCoordinator.start()
    }

    private func runTabBarFlow() {
        let tabBarViewController = TabBarViewController()
        let tabBarCoordinator = coordinatorFactory.createTabBarCoordinator(controller: tabBarViewController)
        addDependency(tabBarCoordinator)
        tabBarCoordinator.flowCompletionHandler = { [weak self] in
            self?.removeDependency(tabBarCoordinator)
        }
        router.setRootController(tabBarViewController, isNavigationBarHidden: false)
        tabBarCoordinator.start()
    }
}
