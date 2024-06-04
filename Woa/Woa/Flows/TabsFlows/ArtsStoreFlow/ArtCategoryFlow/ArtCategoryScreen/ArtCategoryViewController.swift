//
//  ArtCategoryViewController.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import UIKit

class ArtCategoryViewController: UIViewController, ControllerProtocol {
    // MARK: - Private constants
    private let viewModel: ArtCategoryViewModel
    private let artCategoryView: ArtCategoryView
    private let artCategoryDataSourse: ArtCategoryDataSourse

    // MARK: - Variables
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Init
    init(viewModel: ArtCategoryViewModel, type: ArtType) {
        self.viewModel = viewModel
        self.artCategoryView = ArtCategoryView(frame: .zero, type)
        self.artCategoryDataSourse = ArtCategoryDataSourse()
        super.init(nibName: nil, bundle: nil)
        viewModel.getArtsForCategory(type)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = artCategoryView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artCategoryView.setCollectioViewsDataSource(artCategoryDataSourse)
        artCategoryView.reloadData()
    }
}

// MARK: - Bindings
private extension ArtCategoryViewController {
    func setupBindings() {
        viewModel.arts.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            artCategoryDataSourse.updateArts(arts)
            artCategoryView.reloadData()
        }
    }
}
