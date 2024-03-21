//
//  AppCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class AppCoordinator: BaseCoordinator {

    private var router: Router
    private let authModel: AuthModel

    init(router: Router) {
        self.router = router
        authModel = AuthModel.shared
    }

    // хардкод 0_о
    override func start() {
        if true {
            runAuthFlow()
        } else {
            runTabBarFlow()
        }
    }

    private func runAuthFlow() {
        let authFlowCoordinator = coordinatorFactory.createAuthCoordinator(router: router)
        authFlowCoordinator.start()
        addDependency(authFlowCoordinator)
        authFlowCoordinator.flowCompletionHandler = { [weak self] in
            self?.runTabBarFlow()
            self?.removeDependency(authFlowCoordinator)
        }
    }

    private func runTabBarFlow() {
        let tabBarViewController = TabBarViewController()
        let tabBarCoordinator = coordinatorFactory.createTabBarCoordinator(controller: tabBarViewController)
        addDependency(tabBarCoordinator)
        tabBarCoordinator.flowCompletionHandler = { [weak self] in
            self?.removeDependency(tabBarCoordinator)
        }
        router.setRootController(tabBarViewController, isNavigationBarHidden: true)
        tabBarCoordinator.start()
    }
}