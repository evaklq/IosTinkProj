//
//  SceneDelegate.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let router = Router(rootController: UINavigationController())
        appCoordinator = CoordinatorFactory().createAppCoordinator(router: router)

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = router.presenter()

        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }
}

