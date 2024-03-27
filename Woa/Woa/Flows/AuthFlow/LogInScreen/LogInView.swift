//
//  LogInView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit
import SnapKit

protocol LogInViewDelegate: AnyObject {
    func didPressLogIn(_ nick: String?, _ pass: String?)
}

class LogInView: BaseView {
    // MARK: - Subviews
    weak var delegate: LogInViewDelegate?
    private lazy var backImage: UIImageView = UIImageView(image: Asset.Assets.authDecor.image.withTintColor(Asset.Colors.backDecor.color))
    private lazy var nickTextField = createDefaultTextField(Strings.nick)
    private lazy var nickErrorsLabel = createErrorLabel()
    private lazy var passTextField = createDefaultTextField(Strings.pass)
    private lazy var passErrorsLabel = createErrorLabel()

    private lazy var logInButton = createDefaultButton(Strings.authButton, logInAction)
    private var logInAction = UIAction { _ in }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLogInAction()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Actions
extension LogInView {
    private func createLogInAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.didPressLogIn(self.nickTextField.text, self.passTextField.text)
        }
        logInAction = action
    }
}

// MARK: - Configure Constrains
extension LogInView {
    private func configureUI() {
        let backView = UIView()
        backView.addSubview(backImage)
        backView.backgroundColor = Asset.Colors.back.color

        let textFields = [nickTextField, passTextField]
        let textFieldsStackView = UIStackView(arrangedSubviews: textFields)

        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 30

        addSubviews([backView, textFieldsStackView, nickErrorsLabel, passErrorsLabel, logInButton])

        backView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        backImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(18)
            make.bottom.equalToSuperview().inset(40)
        }

        textFieldsStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-20)
            make.leading.trailing.equalToSuperview().inset(33)
        }

        setHeight(height: 47, views: textFields)
        setErrors(label: nickErrorsLabel, textFiled: nickTextField)
        setErrors(label: passErrorsLabel, textFiled: passTextField)

        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passErrorsLabel.snp.bottom).offset(33)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
}
