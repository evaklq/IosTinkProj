//
//  TabBarCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class TabBarCoordinator: BaseCoordinator {
    // MARK: - Declaration objects
    weak var tabBarDelegateProtocol: TabBarDelegateProtocol?

    // MARK: - Init
    init(controller: TabBarDelegateProtocol) {
        self.tabBarDelegateProtocol = controller
    }

    override func start() {
        tabBarDelegateProtocol?.onViewDidAppear = runFamousArtsFlow()
        tabBarDelegateProtocol?.onFamousArtsFlowSelect = runFamousArtsFlow()
        tabBarDelegateProtocol?.onArtsStoreFlowSelect = runArtsStoreFlow()
        tabBarDelegateProtocol?.onCartFlowSelect = runCartFlow()
        tabBarDelegateProtocol?.onProfileFlowSelect = runProfileFlow()
    }
}

// MARK: - Configure flows actions
extension TabBarCoordinator {
    private func runFamousArtsFlow() -> ((UINavigationController) -> Void) {
        return { [weak self] navigationController in
            guard let self, navigationController.viewControllers.isEmpty else { return }
            let router = Router(rootController: navigationController)
            let famousArtsCoordinator = coordinatorFactory.createFamousArtsCoordinator(router: router)
            self.addDependency(famousArtsCoordinator)
            famousArtsCoordinator.flowCompletionHandler = { [weak self] in
                self?.removeDependency(famousArtsCoordinator)
            }
            famousArtsCoordinator.start()
        }
    }

    private func runArtsStoreFlow() -> ((UINavigationController) -> Void) {
        return { [weak self] navigationController in
            guard let self, navigationController.viewControllers.isEmpty else { return }
            let router = Router(rootController: navigationController)
            let artsStoreCoordinator = coordinatorFactory.createArtsStoreCoordinator(router: router)
            self.addDependency(artsStoreCoordinator)
            artsStoreCoordinator.flowCompletionHandler = { [weak self] in
                self?.removeDependency(artsStoreCoordinator)
            }
            artsStoreCoordinator.start()
        }
    }

    private func runCartFlow() -> ((UINavigationController) -> Void) {
        return { [weak self] navigationController in
            guard let self, navigationController.viewControllers.isEmpty else { return }
            let router = Router(rootController: navigationController)
            let cartCoordiantor = coordinatorFactory.createCartCoordinator(
                router: router)
            self.addDependency(cartCoordiantor)
            cartCoordiantor.flowCompletionHandler = { [weak self] in
                self?.removeDependency(cartCoordiantor)
            }
            cartCoordiantor.start()
        }
    }

    private func runProfileFlow() -> ((UINavigationController) -> Void) {
        return { [weak self] navigationController in
            guard let self, navigationController.viewControllers.isEmpty else { return }
            let router = Router(rootController: navigationController)
            let profileCoordinator = coordinatorFactory.createProfileCoordinator(router: router)
            self.addDependency(profileCoordinator)
            profileCoordinator.flowCompletionHandler = { [weak self] in
                self?.removeDependency(profileCoordinator)
            }
            profileCoordinator.start()
        }
    }
}
