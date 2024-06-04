//
//  ProfileView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

protocol ProfileViewDelegate: AnyObject {
    func didTapArtsLabel()
    func didTapChangeProfileLabel()
    func didTapPurchasesLabel()
    func didTapFavoritesLabel()
}

class ProfileView: BaseView {
    // MARK: - UI elements
    private lazy var backImage = UIImageView()
    private lazy var userImage = UIImageView()
    private lazy var userNameLabel = uiFactory.createLabel(type: .title, size: 30)
    private lazy var userEmailLabel = uiFactory.createLabel(type: .default)

    private lazy var userArtsLabel = uiFactory.createLabel(type: .default, text: "Your arts", size: 20)
    private lazy var userPurchasesLabel = uiFactory.createLabel(type: .default, text: "Your purchases", size: 20)
    private lazy var changeProfileLabel = uiFactory.createLabel(type: .default, text: "Change profile", size: 20)
    private lazy var userFavoritesLabel = uiFactory.createLabel(type: .default, text: "Favorites", size: 20)

    private lazy var artsImage = UIImageView()
    private lazy var purchasesImage = UIImageView()
    private lazy var changeProfileImage = UIImageView()
    private lazy var favoritesImage = UIImageView()

    // MARK: - Variables
    weak var delegate: ProfileViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        userArtsLabel.isUserInteractionEnabled = true
        changeProfileLabel.isUserInteractionEnabled = true
        userPurchasesLabel.isUserInteractionEnabled = true
        userFavoritesLabel.isUserInteractionEnabled = true
        configureUI()

        let artsGesture = UITapGestureRecognizer(target: self, action: #selector(artsLabelTapped))
        userArtsLabel.addGestureRecognizer(artsGesture)

        let changeProfileGesture = UITapGestureRecognizer(target: self, action: #selector(changeProfileTapped))
        changeProfileLabel.addGestureRecognizer(changeProfileGesture)

        let userPurchasesGesture = UITapGestureRecognizer(target: self, action: #selector(purchasesTapped))
        userPurchasesLabel.addGestureRecognizer(userPurchasesGesture)

        let favoritesGesture = UITapGestureRecognizer(target: self, action: #selector(favoritesTapped))
        userFavoritesLabel.addGestureRecognizer(favoritesGesture)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileView {
    func configureUser(name: String, email: String) {
        userNameLabel.text = name
        userEmailLabel.text = email
    }

    func configureUserImage(image: UIImage) {
        userImage.image = image
    }

    @objc func artsLabelTapped() {
        delegate?.didTapArtsLabel()
    }

    @objc func changeProfileTapped() {
        delegate?.didTapChangeProfileLabel()
    }

    @objc func purchasesTapped() {
        delegate?.didTapPurchasesLabel()
    }

    @objc func favoritesTapped() {
        delegate?.didTapFavoritesLabel()
    }
}

// MARK: - Configure UI
private extension ProfileView {
    func configureUI() {
        let backIconColor = Asset.Colors.backDecor.color
        let itemsColor = Asset.Colors.profileItems.color

        backgroundColor = Asset.Colors.back.color
        backImage.image = Asset.Assets.backIcon.image.withTintColor(backIconColor)
        userEmailLabel.textColor = itemsColor
        backImage.layer.cornerRadius = 84
        backImage.clipsToBounds = true
        userImage.clipsToBounds = true
        backImage.contentMode = .scaleAspectFill
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 64
        backImage.addSubview(userImage)

        artsImage.image = Asset.Assets.arts.image.withTintColor(itemsColor)
        purchasesImage.image = Asset.Assets.purchases.image.withTintColor(itemsColor)
        favoritesImage.image = Asset.Assets.likeSelected.image.withTintColor(itemsColor)
        changeProfileImage.image = Asset.Assets.changeProfile.image.withTintColor(itemsColor)

        let userInfoSV = UIStackView(arrangedSubviews: [userNameLabel, userEmailLabel])
        userInfoSV.alignment = .center
        userInfoSV.axis = .vertical
        userInfoSV.spacing = 5

        let artsSV = UIStackView(arrangedSubviews: [userArtsLabel, artsImage])
        let purchasesSV = UIStackView(arrangedSubviews: [userPurchasesLabel, purchasesImage])
        let favoritesSV = UIStackView(arrangedSubviews: [userFavoritesLabel, favoritesImage])
        let changeProfileSV = UIStackView(arrangedSubviews: [changeProfileLabel, changeProfileImage])

        let stackViews = [artsSV, purchasesSV, favoritesSV, changeProfileSV]

        for stackView in stackViews {
            stackView.alignment = .fill
            stackView.spacing = 20
            stackView.axis = .horizontal
        }

        let profileItemsSV = UIStackView(arrangedSubviews: stackViews)
        profileItemsSV.alignment = .center
        profileItemsSV.spacing = 20
        profileItemsSV.axis = .vertical

        addSubviews([backImage, userInfoSV, profileItemsSV])

        backImage.snp.makeConstraints { make in
            make.width.height.equalTo(168)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
        }

        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(128)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }

        userInfoSV.snp.makeConstraints { make in
            make.top.equalTo(backImage.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }

        profileItemsSV.snp.makeConstraints { make in
            make.top.equalTo(userInfoSV.snp.bottom).offset(40)
            make.width.equalTo(240)
            make.centerX.equalToSuperview()
        }

        artsImage.snp.makeConstraints { make in
            make.width.height.equalTo(45)
        }

        changeProfileImage.snp.makeConstraints { make in
            make.width.height.equalTo(45)
        }

        purchasesImage.snp.makeConstraints { make in
            make.width.height.equalTo(45)
        }

        favoritesImage.snp.makeConstraints { make in
            make.width.height.equalTo(45)
        }
    }
}
