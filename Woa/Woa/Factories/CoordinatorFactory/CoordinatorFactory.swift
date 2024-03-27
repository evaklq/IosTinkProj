//
//  CoordinatorFactory.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

class CoordinatorFactory: CoordinatorFactoryProtocol {
    func createAppCoordinator(router: Router) -> AppCoordinator {
        AppCoordinator(router: router)
    }
    func createAuthCoordinator(router: Router) -> AuthCoordinator {
        AuthCoordinator(router: router)
    }
    func createTabBarCoordinator(controller: TabBarDelegateProtocol) -> TabBarCoordinator {
        TabBarCoordinator(controller: controller)
    }
    func createFamousArtsCoordinator(router: Router) -> FamousArtsCoordinator {
        FamousArtsCoordinator(router: router)
    }
    func createArtsStoreCoordinator(router: Router) -> ArtsStoreCoordinator {
        ArtsStoreCoordinator(router: router)
    }
    func createCartCoordinator(router: Router) -> CartCoordinator {
        CartCoordinator(router: router)
    }
    func createProfileCoordinator(router: Router) -> ProfileCoordinator {
        ProfileCoordinator(router: router)
    }
}
