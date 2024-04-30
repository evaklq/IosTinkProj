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
    private lazy var artImage = UIImageView()
    private lazy var yearLabel = uiFactory.createLabel(type: .default)
    private lazy var nameLabel = uiFactory.createLabel(type: .title)
    private lazy var typeLabel = uiFactory.createLabel(type: .default)
    private var likeButton: UIButton?

    // MARK: - Private constants
    private let uiFactory = UIFactoryMethod()

    // MARK: - Variables
    var isLike = Observable(Like(isLike: false))
    weak var table: UITableView?
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureLikeButton()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure cell
extension BaseViewCell {
    func configureCell(with art: Art) {
        artImage.image = art.image
        yearLabel.text = art.stringYear
        nameLabel.text = art.name
        typeLabel.text = art.type.description
        isLike.value?.isLike = art.isLike
        likeButton?.isSelected = art.isLike
    }

    private func configureLikeButton() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            var like = isLike.value?.isLike ?? false
            like.toggle()
            self.isLike.value = Like(isLike: like, cellIndex: getIndexPath())
            self.likeButton?.isSelected = like
        }

        likeButton = uiFactory.createButton(type: .like, action: action, isLike: isLike.value?.isLike ?? false)
    }

    private func getIndexPath() -> IndexPath {
        return (table?.indexPath(for: self) ?? IndexPath(row: 0, section: 0))
    }
}

private extension BaseViewCell {
    func configureUI() {
        backgroundColor = Asset.Colors.back.color
        let labelsSV = UIStackView(arrangedSubviews: [yearLabel, nameLabel, typeLabel])
        labelsSV.axis = .vertical
        labelsSV.alignment = .leading
        labelsSV.spacing = 4

        layer.borderWidth = 0.7
        layer.borderColor = UIColor.gray.cgColor

        contentView.addSubview(labelsSV)
        contentView.addSubview(artImage)
        contentView.addSubview(likeButton ?? UIButton())

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
            make.centerY.equalToSuperview()
            make.width.height.equalTo(27)
            make.trailing.equalToSuperview().offset(-10)
        })
    }
}
