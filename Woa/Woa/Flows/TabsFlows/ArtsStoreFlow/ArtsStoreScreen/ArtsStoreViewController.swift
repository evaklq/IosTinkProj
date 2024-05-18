//
//  ArtsStoreViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ArtsStoreViewController: UIViewController, ControllerProtocol {
    // MARK: - Private constants
    private let viewModel: ArtsStoreViewModel
    private let artsStoreView: ArtsStoreView
    private let picturesDataSourse: PicturesDataSourse
    private let sculpturesDataSourse: SculpturesDataSourse
    private let photosDataSourse: PhotosDataSourse
    private let graphicsDataSourse: GraphicsDataSourse
    private let artOdjectsDataSourse: ArtObjectsDataSourse

    // MARK: - Variables
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Init
    init(viewModel: ArtsStoreViewModel) {
        self.viewModel = viewModel
        self.artsStoreView = ArtsStoreView(frame: .zero)
        self.picturesDataSourse = PicturesDataSourse()
        self.sculpturesDataSourse = SculpturesDataSourse()
        self.photosDataSourse = PhotosDataSourse()
        self.graphicsDataSourse = GraphicsDataSourse()
        self.artOdjectsDataSourse = ArtObjectsDataSourse()
        super.init(nibName: nil, bundle: nil)
        viewModel.getArtsForCategories()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = artsStoreView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artsStoreView.setCollectioViewsDataSource(
            picturesDataSourse,
            sculpturesDataSourse,
            photosDataSourse,
            graphicsDataSourse,
            artOdjectsDataSourse
        )
        artsStoreView.reloadData()
    }
}

// MARK: - Bindings
private extension ArtsStoreViewController {
    func setupBindings() {
        viewModel.pictures.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            picturesDataSourse.updatePictures(arts)
            artsStoreView.reloadPictures()
        }

        viewModel.sculptures.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            sculpturesDataSourse.updateSculptures(arts)
            artsStoreView.reloadSculptures()
        }

        viewModel.photos.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            photosDataSourse.updatePhotos(arts)
            artsStoreView.reloadPhotos()
        }

        viewModel.graphics.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            graphicsDataSourse.updateGraphics(arts)
            artsStoreView.reloadGraphics()
        }

        viewModel.artObjects.bind { [weak self] (arts) in
            guard let self, let arts else { return }
            if arts.isEmpty {
                return
            }
            artOdjectsDataSourse.updateArtObjects(arts)
            artsStoreView.reloadArtObjects()
        }
    }
}
