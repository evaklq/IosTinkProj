//
//  CartViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

class CartViewModel {
    var artsInCart = Observable([Art]())
    let networkService = NetworkService.shared

    func getArtsFromCart() {
        networkService.getArtsByType(type: .picture) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                artsInCart.value = arts

            case .failure(let error):
                print(error)
            }
        }
    }
}
