//
//  ArtCategoryCoordinator.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import UIKit

class ArtCategoryCoordinator: BaseCoordinator {

    var router: Router
    private let type: ArtType

    init(router: Router, type: ArtType) {
        self.router = router
        self.type = type
    }

    override func start() {
        showArtCategoryController()
    }

    private func showArtCategoryController() {
        let artCategoryController = controllerFactory.createArtCategoryController(type: type)

        artCategoryController.flowCompletionHandler = { [weak self] in
            guard let self = self else { return }
            self.flowCompletionHandler?()
        }
        router.dismiss(animated: false)
        router.push(artCategoryController, animated: true)
    }
}


