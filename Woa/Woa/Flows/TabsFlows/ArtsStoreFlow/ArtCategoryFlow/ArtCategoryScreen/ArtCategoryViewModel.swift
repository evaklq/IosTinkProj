//
//  ArtCategoryViewModel.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import Foundation

class ArtCategoryViewModel {
    var arts = Observable([Art]())
    let networkService = NetworkService.shared

    func getArtsForCategory(_ type: ArtType) {
        networkService.getArtsByType(type: type) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                self.arts.value = arts

            case .failure(let error):
                print(error)
            }
        }
    }
}
