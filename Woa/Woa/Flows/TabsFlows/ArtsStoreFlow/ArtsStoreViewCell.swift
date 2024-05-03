//
//  ArtsStoreViewCell.swift
//  Woa
//
//  Created by evaklq on 2024-05-01.
//

import UIKit

class ArtsStoreViewCell: UICollectionViewCell {
    // MARK: - UI elements
    private lazy var backImage = UIImageView(image: Asset.Assets.backCell.image)
    private lazy var artImage = UIImageView()
    private lazy var costLabel = uiFactory.createLabel(type: .default)
    private lazy var titleLabel = uiFactory.createLabel(type: .title)

    // MARK: - Constants
    private let uiFactory = UIFactoryMethod()

    // MARK: - Variables
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    var collectionView: UICollectionView?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure cell
    func configureCell(with art: Art) {
        artImage.image = art.image
        costLabel.text = art.cost
        titleLabel.text = art.name
    }
}

// MARK: - Configure UI
private extension ArtsStoreViewCell {
    func configureUI() {
        let labelsSV = UIStackView(arrangedSubviews: [costLabel, titleLabel])
        labelsSV.axis = .vertical
        labelsSV.alignment = .leading
        labelsSV.spacing = 4

        backgroundColor = Asset.Colors.back.color
        artImage.contentMode = .scaleAspectFill
        backImage.contentMode = .scaleAspectFill
        costLabel.textColor = Asset.Colors.cost.color

        backImage.addSubview(artImage)
        contentView.addSubview(backImage)
        contentView.addSubview(labelsSV)

        backImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        artImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.greaterThanOrEqualTo(backImage.snp.top).offset(40)
            make.leading.greaterThanOrEqualTo(backImage.snp.leading).offset(20)
            make.trailing.lessThanOrEqualTo(backImage.snp.trailing).offset(-20)
            make.bottom.lessThanOrEqualTo(backImage.snp.bottom).offset(-40)
        }

        labelsSV.snp.makeConstraints { make in
            make.top.equalTo(backImage.snp.bottom).offset(10)
            make.leading.trailing.equalTo(backImage.snp.leading)
        }
    }
}
