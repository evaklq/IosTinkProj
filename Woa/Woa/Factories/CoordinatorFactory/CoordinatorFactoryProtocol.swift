//
//  CoordinatorFactoryProtocol.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func createAppCoordinator(router: Router) -> AppCoordinator
    func createAuthCoordinator(router: Router) -> AuthCoordinator
    func createTabBarCoordinator(controller: TabBarDelegateProtocol) -> TabBarCoordinator
    func createFamousArtsCoordinator(router: Router) -> FamousArtsCoordinator
    func createArtsStoreCoordinator(router: Router) -> ArtsStoreCoordinator
    func createCartCoordinator(router: Router) -> CartCoordinator
    func createProfileCoordinator(router: Router) -> ProfileCoordinator
    func createUserArtsCoordinator(router: Router) -> UserArtsCoordinator
    func createArtCategoryCoordinator(router: Router, type: ArtType) -> ArtCategoryCoordinator
}
