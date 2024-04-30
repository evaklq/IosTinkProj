//
//  BaseViewCell.swift
//  Woa
//
//  Created by evaklq on 2024-04-16.
//

import UIKit
import SnapKit

class BaseViewCell: UITableViewCell {
    // MARK: - UI elements
    lazy var artImage = UIImageView()
    lazy var infoLabel = uiFactory.createLabel(type: .default)
    lazy var nameLabel = uiFactory.createLabel(type: .title)
    lazy var typeLabel = uiFactory.createLabel(type: .default)
    var likeButton: UIButton?
    var cartButton: UIButton?

    // MARK: - Constants
    let uiFactory = UIFactoryMethod()

    // MARK: - Variables
    var isLike = Observable(Like(isLike: false))
    var isInCart = Observable(Cart(isInCart: false))
    weak var table: UITableView?
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureLikeButton()
        configureCartButton()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure cell
    func configureCell(with art: Art) {
        artImage.image = art.image
        infoLabel.text = art.stringYear
        nameLabel.text = art.name
        typeLabel.text = art.type.description
        isLike.value?.isLike = art.isLike
        isInCart.value?.isInCart = art.isInCart
        likeButton?.isSelected = art.isLike
        cartButton?.isSelected = art.isInCart
    }
}

// MARK: - Configure actions
private extension BaseViewCell {
    func configureLikeButton() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            var like = isLike.value?.isLike ?? false
            like.toggle()
            self.isLike.value = Like(isLike: like, cellIndex: getIndexPath())
            self.likeButton?.isSelected = like
        }

        likeButton = uiFactory.createButton(type: .like, action: action, isLike: isLike.value?.isLike ?? false)
    }

    func configureCartButton() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            var isInCart = isInCart.value?.isInCart ?? false
            isInCart.toggle()
            self.isInCart.value = Cart(isInCart: isInCart, cellIndex: getIndexPath())
            self.cartButton?.isSelected = isInCart
        }

        cartButton = uiFactory.createButton(type: .cart, action: action, isInCart: isInCart.value?.isInCart ?? false)
    }

    func getIndexPath() -> IndexPath {
        return (table?.indexPath(for: self) ?? IndexPath(row: 0, section: 0))
    }
}

// MARK: - Configure UI
private extension BaseViewCell {
    func configureUI() {
        let labelsSV = UIStackView(arrangedSubviews: [infoLabel, nameLabel, typeLabel])
        labelsSV.axis = .vertical
        labelsSV.alignment = .leading
        labelsSV.spacing = 4

        artImage.contentMode = .scaleAspectFill
        artImage.clipsToBounds = true

        layer.borderWidth = 0.7
        layer.borderColor = UIColor.gray.cgColor

        backgroundColor = Asset.Colors.back.color

        contentView.addSubview(labelsSV)
        contentView.addSubview(artImage)
        contentView.addSubview(likeButton ?? UIButton())
        contentView.addSubview(cartButton ?? UIButton())

        artImage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.width.equalTo(90)
        }

        labelsSV.snp.makeConstraints { make in
            make.leading.equalTo(artImage.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview().inset(10)
        }

        likeButton?.snp.makeConstraints({ make in
            make.top.equalTo(labelsSV.snp.top)
            make.width.height.equalTo(27)
            make.trailing.equalToSuperview().offset(-10)
        })

        cartButton?.snp.makeConstraints({ make in
            make.bottom.equalTo(labelsSV.snp.bottom)
            make.width.height.equalTo(27)
            make.trailing.equalToSuperview().offset(-10)
        })
    }
}
