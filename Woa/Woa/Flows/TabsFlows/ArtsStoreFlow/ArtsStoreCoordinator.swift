//
//  ArtsStoreCoordinator.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ArtsStoreCoordinator: BaseCoordinator {

    var router: Router

    init(router: Router) {
        self.router = router
    }

    override func start() {
        showArtsStoreController()
    }

    private func showArtsStoreController() {
        let artsStoreController = controllerFactory.createArtsStoreController()

        artsStoreController.flowCompletionHandlerWithValue = { [weak self] type in
            guard let self = self else { return }
            showArtCategoryFlow(type)
            self.flowCompletionHandler?()
        }
        
        router.setRootController(artsStoreController)
    }

    private func showArtCategoryFlow(_ type: ArtType) {
        let artCategoryCoordinator = coordinatorFactory.createArtCategoryCoordinator(router: router, type: type)
        addDependency(artCategoryCoordinator)
        artCategoryCoordinator.flowCompletionHandler = { [weak self, artCategoryCoordinator] in
            self?.removeDependency(artCategoryCoordinator)
        }

        artCategoryCoordinator.start()
    }
}
