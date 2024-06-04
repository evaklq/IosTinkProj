//
//  UserPurchasesViewCell.swift
//  Woa
//
//  Created by evaklq on 2024-05-22.
//

import UIKit

class UserPurchasesViewCell: BaseViewCell {
    private lazy var dateLabel = uiFactory.createLabel(type: .default)
    private lazy var statusLabel = uiFactory.createLabel(type: .title)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cartButton?.isHidden = true
        likeButton?.isHidden = true
        infoLabel.textColor = Asset.Colors.cost.color
        statusLabel.textColor = Asset.Colors.profileItems.color
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(with order: Order) {
        artImage.image = order.images[0]
        infoLabel.text = order.cost
        nameLabel.text = order.name
        typeLabel.text = order.type.description
        dateLabel.text = formatDate(order.dateOfOrder)
        statusLabel.text = order.status.description
    }
}

// MARK: - Configure UI
private extension UserPurchasesViewCell {
    func configureUI() {
        contentView.addSubview(statusLabel)
        contentView.addSubview(dateLabel)

        statusLabel.snp.makeConstraints({ make in
            make.top.equalTo(labelsSV.snp.top)
            make.trailing.equalTo(likeButton?.snp.trailing ?? labelsSV)
        })

        dateLabel.snp.makeConstraints({ make in
            make.bottom.equalTo(labelsSV.snp.bottom)
            make.trailing.equalTo(statusLabel.snp.trailing)
        })
    }

    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

