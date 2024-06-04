//
//  FamousArtsViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class FamousArtsViewModel {
    var popularArts = Observable([Art]())
    let networkService = NetworkService.shared

    func getPopularArts() {
        networkService.getPopularArts(amount: nil) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                popularArts.value = arts

            case .failure(let error):
                print(error)
            }
        }
    }
}

private extension FamousArtsViewModel {
}
