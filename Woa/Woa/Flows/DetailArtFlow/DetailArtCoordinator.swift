//
//  DetailArtCoordinator.swift
//  Woa
//
//  Created by evaklq on 2024-05-26.
//

import UIKit

class DetailArtCoordinator: BaseCoordinator {

    var router: Router
    private var art: Art

    init(router: Router, art: Art) {
        self.router = router
        self.art = art
    }

    override func start() {
        showDetailArtController(art: art)
    }

    private func showDetailArtController(art: Art) {
        let detailArtController = controllerFactory.createDetailArtController(art: art)

        detailArtController.flowCompletionHandler = { [weak self] in
            self?.flowCompletionHandler?()
        }
        router.dismiss(animated: false)
        router.push(detailArtController, animated: true)
    }
}

