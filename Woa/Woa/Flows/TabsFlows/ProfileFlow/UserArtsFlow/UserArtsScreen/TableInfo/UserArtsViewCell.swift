//
//  UserArtsViewCell.swift
//  Woa
//
//  Created by evaklq on 2024-05-19.
//

import UIKit

class UserArtsViewCell: BaseViewCell {
    private var archiveButton: UIButton?
    private var editButton: UIButton?

    var isSelling = Observable(Selling(isSelling: false))
    var isEdit = Observable(Edit(isEditing: false))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cartButton?.isHidden = true
        likeButton?.isHidden = true
        infoLabel.textColor = Asset.Colors.cost.color
        configureEditButton()
        configureArchiveButton(isSelled: false)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func configureCell(with art: Art) {
        artImage.image = art.images[0]
        infoLabel.text = art.cost
        nameLabel.text = art.name
        typeLabel.text = art.type.description
        isSelling.value?.isSelling = art.isSelling
        archiveButton?.isSelected = art.isSelling
        configureArchiveButton(isSelled: art.isSelled)
    }
}

private extension UserArtsViewCell {
    func configureArchiveButton(isSelled: Bool) {
        archiveButton?.removeFromSuperview()
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            var selling = isSelling.value?.isSelling ?? false
            selling.toggle()
            self.isSelling.value = Selling(isSelling: selling, cellIndex: getIndexPath())
        }

        archiveButton = uiFactory.createButton(type: .arcive, action: action, isSelling: isSelling.value?.isSelling ?? false, isSelled: isSelled)

        contentView.addSubview(archiveButton ?? UIButton())
        archiveButton?.snp.makeConstraints({ make in
            make.top.equalTo(labelsSV.snp.top)
            if !isSelled {
                make.width.height.equalTo(27)
            }
            make.trailing.equalTo(likeButton?.snp.trailing ?? labelsSV)
        })
    }

    func configureEditButton() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            var isEditing = isEdit.value?.isEditing ?? true
            isEditing.toggle()
            isEdit.value = Edit(isEditing: isEditing, cellIndex: getIndexPath())
        }

        editButton = uiFactory.createButton(type: .text, action: action, title: "Edit")
    }
}

// MARK: - Configure UI
private extension UserArtsViewCell {
    func configureUI() {
        contentView.addSubview(editButton ?? UIButton())

        editButton?.snp.makeConstraints({ make in
            make.bottom.equalTo(labelsSV.snp.bottom)
            make.width.height.equalTo(27)
            make.trailing.equalTo(cartButton?.snp.trailing ?? labelsSV)
        })
    }
}
