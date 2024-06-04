//
//  FavoritesViewController.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import UIKit

class FavoritesViewController: UIViewController, ControllerProtocol {
    var flowCompletionHandler: CompletionHandler?
    private let viewModel: FavoritesViewModel
    private let favoritesView: FavoritesView
    private var favoritesDataSourse: FavoritesDataSourse

    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
        self.favoritesView = FavoritesView(frame: .zero)
        self.favoritesDataSourse = FavoritesDataSourse()
        viewModel.getFavorites()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = favoritesView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritesView.setTableDataSource(favoritesDataSourse)
        favoritesView.reloadData()
    }
}

private extension FavoritesViewController {
    func setupBindings() {
        viewModel.favorites.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            favoritesDataSourse.updateArts(arts)
            favoritesView.reloadData()
        }
    }
}


