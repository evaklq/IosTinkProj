//
//  ArtsStoreView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

protocol ArtsStoreViewDelegate: AnyObject {
    func didTapPicturesLabel()
    func didTapSculpturesLabel()
    func didTapPhotosLabel()
    func didTapArtObjectsLabel()
    func didTapGraphicsLabel()
}

class ArtsStoreView: BaseView {
    // MARK: - Variables
    weak var delegate: ArtsStoreViewDelegate?

    // MARK: - UI elements
    private lazy var wecomeUserLabel = uiFactory.createLabel(type: .default, text: Strings.Title.welcomeUser)
    private lazy var searchArtTextField = uiFactory.createTextField(type: .search, placeholder: Strings.Title.mainFindTextField, action: searchAction)
    private lazy var mainScrollView = createScrollView()
    private lazy var picturesLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularPicteres)
    private lazy var picturesCollectionView = createCollectionView()
    private lazy var sculpturesLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularSculptures)
    private lazy var sculpturesCollectionView = createCollectionView()
    private lazy var photosLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularPhotos)
    private lazy var photosCollectionView = createCollectionView()
    private lazy var graphicsLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularGraphics)
    private lazy var graphicsCollectionView = createCollectionView()
    private lazy var artsObjectsLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularArtObjects)
    private lazy var artsObjectsCollectionView = createCollectionView()

    // MARK: - Actions
    private var searchAction: UIAction?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSearchAction()
        configureCollectionViews()
        configureUI()

        picturesLabel.isUserInteractionEnabled = true
        sculpturesLabel.isUserInteractionEnabled = true
        photosLabel.isUserInteractionEnabled = true
        graphicsLabel.isUserInteractionEnabled = true
        artsObjectsLabel.isUserInteractionEnabled = true

        let picturesGesture = UITapGestureRecognizer(target: self, action: #selector(picturesLabelTapped))
        picturesLabel.addGestureRecognizer(picturesGesture)

        let sculpturesGesture = UITapGestureRecognizer(target: self, action: #selector(sculpturesLabelTapped))
        sculpturesLabel.addGestureRecognizer(sculpturesGesture)

        let photosGesture = UITapGestureRecognizer(target: self, action: #selector(photosLabelTapped))
        photosLabel.addGestureRecognizer(photosGesture)

        let graphicsGesture = UITapGestureRecognizer(target: self, action: #selector(graphicsLabelTapped))
        graphicsLabel.addGestureRecognizer(graphicsGesture)

        let artsObjectsGesture = UITapGestureRecognizer(target: self, action: #selector(artObjectsLabelTapped))
        artsObjectsLabel.addGestureRecognizer(artsObjectsGesture)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure collection vies from ViewController
extension ArtsStoreView {
    func setCollectioViewsDataSource(
        _ picturesDS: UICollectionViewDataSource,
        _ sculpturesDS: UICollectionViewDataSource,
        _ photosDS: UICollectionViewDataSource,
        _ graphicsDS: UICollectionViewDataSource,
        _ artsObjectsDS: UICollectionViewDataSource
    ) {
        picturesCollectionView.dataSource = picturesDS
        sculpturesCollectionView.dataSource = sculpturesDS
        photosCollectionView.dataSource = photosDS
        graphicsCollectionView.dataSource = graphicsDS
        artsObjectsCollectionView.dataSource = artsObjectsDS
    }

    func reloadData() {
        reloadPictures()
        reloadSculptures()
        reloadPhotos()
        reloadGraphics()
        reloadArtObjects()
    }

    func reloadPictures() {
        DispatchQueue.main.async {
            self.picturesCollectionView.reloadData()
        }
    }

    func reloadSculptures() {
        DispatchQueue.main.async {
            self.sculpturesCollectionView.reloadData()
        }
    }

    func reloadPhotos() {
        DispatchQueue.main.async {
            self.photosCollectionView.reloadData()
        }
    }

    func reloadGraphics() {
        DispatchQueue.main.async {
            self.graphicsCollectionView.reloadData()
        }
    }

    func reloadArtObjects() {
        DispatchQueue.main.async {
            self.artsObjectsCollectionView.reloadData()
        }
    }

    @objc func picturesLabelTapped() {
        delegate?.didTapPicturesLabel()
    }

    @objc func sculpturesLabelTapped() {
        delegate?.didTapSculpturesLabel()
    }

    @objc func photosLabelTapped() {
        delegate?.didTapPhotosLabel()
    }

    @objc func artObjectsLabelTapped() {
        delegate?.didTapArtObjectsLabel()
    }

    @objc func graphicsLabelTapped() {
        delegate?.didTapGraphicsLabel()
    }
}

// MARK: - Configure collection views
private extension ArtsStoreView {
    func configureCollectionViews() {
        let collectionViews = [
            picturesCollectionView,
            sculpturesCollectionView,
            photosCollectionView,
            graphicsCollectionView,
            artsObjectsCollectionView
        ]

        for collectionView in collectionViews {
            collectionView.register(ArtsStoreViewCell.self, forCellWithReuseIdentifier: ArtsStoreViewCell.reuseIdentifier)
        }
    }
}

// MARK: - Configure actions
private extension ArtsStoreView {
    func configureSearchAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            print("search")
        }
        searchAction = action
    }
}

// MARK: - Configure UI
private extension ArtsStoreView {
    func configureUI() {
        addSubviews([wecomeUserLabel, searchArtTextField, mainScrollView])
        let mainView = UIView()
        mainScrollView.addSubview(mainView)
        mainView.addSubview(picturesLabel)
        mainView.addSubview(sculpturesLabel)
        mainView.addSubview(photosLabel)
        mainView.addSubview(graphicsLabel)
        mainView.addSubview(artsObjectsLabel)

        mainView.addSubview(picturesCollectionView)
        mainView.addSubview(sculpturesCollectionView)
        mainView.addSubview(photosCollectionView)
        mainView.addSubview(graphicsCollectionView)
        mainView.addSubview(artsObjectsCollectionView)

        setHeight(height: 47, views: [searchArtTextField])

        backgroundColor = Asset.Colors.back.color

        wecomeUserLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(80)
        }

        searchArtTextField.snp.makeConstraints { make in
            make.top.equalTo(wecomeUserLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        mainScrollView.snp.makeConstraints { make in
            make.top.equalTo(searchArtTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(25)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        picturesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }

        picturesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(picturesLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(270)
        }

        sculpturesLabel.snp.makeConstraints { make in
            make.top.equalTo(picturesCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
        }

        sculpturesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sculpturesLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }

        photosLabel.snp.makeConstraints { make in
            make.top.equalTo(sculpturesCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
        }

        photosCollectionView.snp.makeConstraints { make in
            make.top.equalTo(photosLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }

        graphicsLabel.snp.makeConstraints { make in
            make.top.equalTo(photosCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
        }

        graphicsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(graphicsLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }

        artsObjectsLabel.snp.makeConstraints { make in
            make.top.equalTo(graphicsCollectionView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
        }

        artsObjectsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(artsObjectsLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
