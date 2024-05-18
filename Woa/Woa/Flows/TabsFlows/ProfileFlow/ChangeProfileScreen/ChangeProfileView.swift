//
//  ChangeProfileView.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import UIKit

protocol ChangeProfileViewDelegate: AnyObject {
    func didTapStartToBeAuthorLabel()
}

class ChangeProfileView: BaseView {
    // MARK: - UI elements
    private lazy var backImage = UIImageView()
    private lazy var userImage = UIImageView()
    private lazy var userNameLabel = uiFactory.createLabel(type: .title, text: Strings.Title.welcomeUser, size: 30)
    private lazy var userEmailLabel = uiFactory.createLabel(type: .default, text: Strings.Title.welcomeUser)

    private lazy var getAuthorLabel = uiFactory.createLabel(type: .default, text: "Start to be author", size: 20)

    // MARK: - Variables
    weak var delegate: ChangeProfileViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        getAuthorLabel.isUserInteractionEnabled = true
        configureUI()

        let artsGesture = UITapGestureRecognizer(target: self, action: #selector(artsLabelTapped))
        getAuthorLabel.addGestureRecognizer(artsGesture)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChangeProfileView {
    func configureUser(name: String, email: String) {
        userNameLabel.text = name
        userEmailLabel.text = email
    }

    func configureUserImage(image: UIImage) {
        userImage.image = image
    }

    @objc func artsLabelTapped() {
        delegate?.didTapStartToBeAuthorLabel()
    }
}

// MARK: - Configure UI
private extension ChangeProfileView {
    func configureUI() {
        let backIconColor = Asset.Colors.backDecor.color
        backgroundColor = Asset.Colors.back.color
        backImage.image = Asset.Assets.backIcon.image.withTintColor(backIconColor)
        backImage.layer.cornerRadius = 84
        backImage.clipsToBounds = true
        userImage.clipsToBounds = true
        backImage.contentMode = .scaleAspectFill
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 64
        backImage.addSubview(userImage)

        let userInfoSV = UIStackView(arrangedSubviews: [userNameLabel, userEmailLabel])
        userInfoSV.alignment = .center
        userInfoSV.axis = .vertical
        userInfoSV.spacing = 5

        addSubviews([backImage, userInfoSV, getAuthorLabel])

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

        getAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(userInfoSV.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
}
