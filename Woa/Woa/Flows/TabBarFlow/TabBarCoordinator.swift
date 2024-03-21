//
//  TabBarCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class TabBarCoordinator: BaseCoordinator {

    private var tabBarDelegateProtocol: TabBarDelegateProtocol

    init(controller: TabBarDelegateProtocol) {
        self.tabBarDelegateProtocol = controller
    }

    override func start() {
        tabBarDelegateProtocol.onViewDidAppear = runFamousArtsFlow()
        tabBarDelegateProtocol.onFamousArtsFlowSelect = runFamousArtsFlow()
        tabBarDelegateProtocol.onArtsStoreFlowSelect = runArtsStoreFlow()
        tabBarDelegateProtocol.onCartFlowSelect = runCartFlow()
        tabBarDelegateProtocol.onProfileFlowSelect = runProfileFlow()
    }
}

extension TabBarCoordinator {

    private func runFamousArtsFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let famousArtsCoordinator = coordinatorFactory.createFamousArtsCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(famousArtsCoordinator)
                famousArtsCoordinator.start()
            }
        }
    }

    private func runArtsStoreFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let artsStoreCoordinator = coordinatorFactory.createArtsStoreCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(artsStoreCoordinator)
                artsStoreCoordinator.start()
            }
        }
    }

    private func runCartFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let cartCoordiantor = coordinatorFactory.createCartCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(cartCoordiantor)
                cartCoordiantor.start()
            }
        }
    }

    private func runProfileFlow() -> ((UINavigationController) -> Void) {
        return { [unowned self] navigationController in
            if navigationController.viewControllers.isEmpty {
                let profileCoordinator = coordinatorFactory.createProfileCoordinator(
                    router: Router(rootController: navigationController)
                )
                self.addDependency(profileCoordinator)
                profileCoordinator.start()
            }
        }
    }
}
