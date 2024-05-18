//
//  ArtsStoreViewModel.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import Foundation

class ArtsStoreViewModel {
    var pictures = Observable([Art]())
    var sculptures = Observable([Art]())
    var photos = Observable([Art]())
    var graphics = Observable([Art]())
    var artObjects = Observable([Art]())
    let networkService = NetworkService.shared

    func getArtsForCategories() {
        networkService.getArtsByType(type: .picture) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                pictures.value = arts

            case .failure(let error):
                print(error)
            }
        }

        networkService.getArtsByType(type: .sculpture) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                sculptures.value = arts

            case .failure(let error):
                print(error)
            }
        }

        networkService.getArtsByType(type: .photo) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                photos.value = arts

            case .failure(let error):
                print(error)
            }
        }

        networkService.getArtsByType(type: .graphic) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                graphics.value = arts

            case .failure(let error):
                print(error)
            }
        }

        networkService.getArtsByType(type: .artObject) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let arts):
                artObjects.value = arts

            case .failure(let error):
                print(error)
            }
        }
    }
}
