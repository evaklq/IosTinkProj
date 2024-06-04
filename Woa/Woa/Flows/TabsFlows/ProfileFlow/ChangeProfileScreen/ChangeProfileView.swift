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
    private lazy var backImage1 = UIImageView()
    private lazy var backImage2 = UIImageView()
    private lazy var backImage3 = UIImageView()
    private lazy var backImage4 = UIImageView()
    private lazy var userImage = UIImageView()
    private lazy var changeImageLabel = uiFactory.createLabel(type: .default, text: "Upload new image", size: 20)

    private lazy var nickTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.nick)
    private lazy var emailTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.email)
    private lazy var currentPassTextField = uiFactory.createTextField(type: .default, placeholder: "Current password")
    private lazy var newPassTextField = uiFactory.createTextField(type: .default, placeholder: "New password")

    private lazy var saveButton = uiFactory.createButton(type: .default, action: saveAction, title: "Save")

    private var saveAction: UIAction?

    // MARK: - Variables
    weak var delegate: ChangeProfileViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        changeImageLabel.isUserInteractionEnabled = true
        configureSaveAction()
        configureUI()

        let changeImageGesture = UITapGestureRecognizer(target: self, action: #selector(changeImageLabelTapped))
        changeImageLabel.addGestureRecognizer(changeImageGesture)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChangeProfileView {
    func configureUser(nick: String, email: String) {
        nickTextField.placeholder = nick
        emailTextField.placeholder = email
    }

    func configureUserImage(image: UIImage) {
        userImage.image = image
    }

    @objc func changeImageLabelTapped() {

    }
}

private extension ChangeProfileView {
    func configureSaveAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
        }
        saveAction = action
    }
}

// MARK: - Configure UI
private extension ChangeProfileView {
    func configureUI() {
        let backIconColor = Asset.Colors.backDecor.color
        backImage1.image = Asset.Assets.profileDecor1.image.withTintColor(backIconColor)
        backImage2.image = Asset.Assets.profileDecor2.image.withTintColor(backIconColor)
        backImage3.image = Asset.Assets.profileDecor3.image.withTintColor(backIconColor)
        backImage4.image = Asset.Assets.profileDecor4.image.withTintColor(backIconColor)

        let backView = UIView()
        backView.backgroundColor = Asset.Colors.back.color
        backView.addSubview(backImage1)
        backView.addSubview(backImage2)
        backView.addSubview(backImage3)
        backView.addSubview(backImage4)

        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 65
        userImage.clipsToBounds = true

        let changesTextFields = [nickTextField, emailTextField, currentPassTextField, newPassTextField]
        setHeight(height: 40, views: changesTextFields)

        let changeSV = UIStackView(arrangedSubviews: changesTextFields)
        changeSV.axis = .vertical
        changeSV.spacing = 17

        addSubviews([backView, userImage, changeImageLabel, changeSV, saveButton])

        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backImage1.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(360)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }

        backImage2.snp.makeConstraints { make in
            make.width.equalTo(220)
            make.height.equalTo(330)
            make.centerY.equalToSuperview().offset(40)
            make.trailing.equalToSuperview()
        }

        backImage3.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
        }

        backImage4.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
        }

        userImage.snp.makeConstraints { make in
            make.width.height.equalTo(130)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(120)
        }

        changeImageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(15)
        }

        changeSV.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.centerX.equalToSuperview()
            make.top.equalTo(changeImageLabel.snp.bottom).offset(30)
        }

        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(changeSV.snp.bottom).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
}
