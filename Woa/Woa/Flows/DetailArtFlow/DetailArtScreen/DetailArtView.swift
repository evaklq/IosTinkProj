//
//  DetailArtView.swift
//  Woa
//
//  Created by evaklq on 2024-05-26.
//

import UIKit
import SnapKit

class DetailArtView: BaseView {
    // MARK: - UI elements
    private lazy var nameLabel = uiFactory.createLabel(type: .title, text: "Name")
    private lazy var backImage = UIImageView(image: Asset.Assets.backCell.image.withTintColor(Asset.Colors.backDecor.color))
    private lazy var artImage = UIImageView()
    private lazy var typeLabel = uiFactory.createLabel(type: .title, text: "Type")
    private lazy var yearLabel = uiFactory.createLabel(type: .title, text: "Year")
    private lazy var authorLabel = uiFactory.createLabel(type: .title, text: "Author")
    private lazy var countryLabel = uiFactory.createLabel(type: .title, text: "Country")
    private lazy var typeValueLabel = uiFactory.createLabel(type: .default, text: "Name")
    private lazy var yearValueLabel = uiFactory.createLabel(type: .default, text: "Name")
    private lazy var countryValueLabel = uiFactory.createLabel(type: .default, text: "Name")
    private lazy var descriptionLabel = uiFactory.createLabel(type: .default, text: "Name")
    private lazy var costLabel = uiFactory.createLabel(type: .default, text: "Cost")
    private lazy var costValueLabel = uiFactory.createLabel(type: .default, text: "Cost")
    private lazy var authorValueLabel = uiFactory.createLabel(type: .title, text: "Author")

    private lazy var cartButton = uiFactory.createButton(type: .default, action: cartAction, title: "Add to cart")

    private var cartAction: UIAction?

    // MARK: - Init
    init(frame: CGRect, art: Art) {
        super.init(frame: frame)
        nameLabel.text = art.name
        artImage.image = art.images[0]
        typeValueLabel.text = art.type.description
        yearValueLabel.text = art.stringYear
        costValueLabel.text = art.cost
        descriptionLabel.text = ""
        //authorValueLabel.text = art.author
        configureCartAction()
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Actions
private extension DetailArtView {
    func configureCartAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
        }
        cartAction = action
    }
}

// MARK: - Configure UI
private extension DetailArtView {
    func configureUI() {
        backgroundColor = Asset.Colors.back.color
        costLabel.textColor = Asset.Colors.cost.color

        artImage.contentMode = .scaleAspectFit
        backImage.contentMode = .scaleAspectFill
        backImage.addSubview(artImage)

        let typeSV = UIStackView(arrangedSubviews: [typeLabel, typeValueLabel])
        typeSV.alignment = .leading
        typeSV.axis = .vertical
        typeSV.spacing = 2

        let yearSV = UIStackView(arrangedSubviews: [yearLabel, yearValueLabel])
        yearSV.alignment = .leading
        yearSV.axis = .vertical
        yearSV.spacing = 2

        let authorSV = UIStackView(arrangedSubviews: [authorLabel, authorValueLabel])
        authorSV.alignment = .leading
        authorSV.axis = .vertical
        authorSV.spacing = 2

        let countrySV = UIStackView(arrangedSubviews: [countryLabel, countryValueLabel])
        countrySV.alignment = .leading
        countrySV.axis = .vertical
        countrySV.spacing = 2

        let infoSV = UIStackView(arrangedSubviews: [typeSV, yearSV, authorSV, countrySV])
        infoSV.axis = .horizontal
        infoSV.spacing = 6

        addSubviews([nameLabel, backImage, infoSV, descriptionLabel, costLabel, costValueLabel, cartButton])

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().inset(25)
        }

        backImage.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(300)
        }

        artImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.greaterThanOrEqualTo(backImage.snp.top).offset(40)
            make.leading.greaterThanOrEqualTo(backImage.snp.leading).offset(20)
            make.trailing.lessThanOrEqualTo(backImage.snp.trailing).offset(-20)
            make.bottom.lessThanOrEqualTo(backImage.snp.bottom).offset(-40)
        }

        infoSV.snp.makeConstraints { make in
            make.top.equalTo(backImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(infoSV.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        costLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
        }

        costValueLabel.snp.makeConstraints { make in
            make.top.equalTo(costLabel.snp.bottom).offset(2)
            make.leading.equalToSuperview().inset(25)
        }

        cartButton.snp.makeConstraints { make in
            make.top.equalTo(costLabel.snp.bottom).offset(2)
            make.trailing.equalToSuperview().inset(25)
        }
    }
}

