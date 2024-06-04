//
//  ArtCategoryView.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import UIKit

class ArtCategoryView: BaseView {
    // MARK: - UI elements
    private lazy var categoryLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularPicteres)
    private lazy var categoryCollectionView = createCategoryCollectionView()

    // MARK: - Init
    init(frame: CGRect, _ category: ArtType) {
        super.init(frame: frame)
        categoryLabel.text = category.description + "s for sale"
        configureCollectionViews()
        configureUI()
        categoryCollectionView.delegate = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure collection vies from ViewController
extension ArtCategoryView {
    func setCollectioViewsDataSource(_ categoryDS: UICollectionViewDataSource) {
        categoryCollectionView.dataSource = categoryDS
    }

    func reloadData() {
        categoryCollectionView.reloadData()
    }
}

// MARK: - Configure collection views
private extension ArtCategoryView {
    func configureCollectionViews() {
        categoryCollectionView.register(ArtsStoreViewCell.self, forCellWithReuseIdentifier: ArtsStoreViewCell.reuseIdentifier)
    }
}

// MARK: - Configure UI
private extension ArtCategoryView {
    func configureUI() {
        addSubviews([categoryLabel, categoryCollectionView])
        backgroundColor = Asset.Colors.back.color

        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().inset(25)
        }

        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().offset(-80)
        }
    }
}

