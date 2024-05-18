//
//  LogInView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit
import SnapKit

protocol LogInViewDelegate: AnyObject {
    func didTapLogInButton(_ nick: String?, _ pass: String?)
}

class LogInView: BaseView {
    // MARK: - UI elements
    private lazy var emailTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.email)
    private lazy var passTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.pass)
    private lazy var logInButton = uiFactory.createButton(type: .default, action: logInAction, title: Strings.Button.auth)

    private lazy var emailErrorsLabel = uiFactory.createLabel(type: .error)
    private lazy var passErrorsLabel = uiFactory.createLabel(type: .error)

    private lazy var color = Asset.Colors.backDecor.color
    private lazy var decorImag = Asset.Assets.authDecor.image.withTintColor(color)
    private lazy var backImage = UIImageView(image: decorImag)

    private var logInAction: UIAction?

    // MARK: - Variables
    weak var delegate: LogInViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLogInAction()
        configureUI()
    }

    convenience init(frame: CGRect, email: String?, pass: String?) {
        self.init(frame: frame)
        configureTextFields(email: email, pass: pass)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure errors from controller
extension LogInView {
    func getAlert(_ mes: String) -> UIAlertController {
        uiFactory.createAlert(type: .error, message: mes)
    }
}

// MARK: - Configure Actions
private extension LogInView {
    func createLogInAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.didTapLogInButton(self.emailTextField.text, self.passTextField.text)
        }
        logInAction = action
    }
}

// MARK: - Configure UI
private extension LogInView {
    func configureUI() {
        let backView = UIView()
        backView.addSubview(backImage)
        backView.backgroundColor = Asset.Colors.back.color

        let textFields = [emailTextField, passTextField]
        let textFieldsStackView = UIStackView(arrangedSubviews: textFields)

        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 30

        addSubviews([backView, textFieldsStackView, emailErrorsLabel, passErrorsLabel, logInButton])

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
        setErrors(label: emailErrorsLabel, textFiled: emailTextField)
        setErrors(label: passErrorsLabel, textFiled: passTextField)

        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passErrorsLabel.snp.bottom).offset(33)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }

    func configureTextFields(email: String?, pass: String?) {
        guard let email = email, let pass = pass else { return }
        emailTextField.text = email
        passTextField.text = pass
    }
}
