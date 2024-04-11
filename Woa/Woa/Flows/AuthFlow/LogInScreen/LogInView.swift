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
    private lazy var emailTextField = createDefaultTextField(Strings.Title.email)
    private lazy var emailErrorsLabel = createErrorLabel()
    private lazy var passTextField = createDefaultTextField(Strings.Title.pass)
    private lazy var passErrorsLabel = createErrorLabel()

    private lazy var logInButton = createDefaultButton(Strings.Button.auth, logInAction)
    private var logInAction = UIAction { _ in }

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

extension LogInView {
    func getAlert(_ mes: String) -> UIAlertController {
        createErrorAlert(mes)
    }
}

// MARK: - Configure Actions
extension LogInView {
    private func createLogInAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.didPressLogIn(self.emailTextField.text, self.passTextField.text)
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

    private func configureTextFields(email: String?, pass: String?) {
        guard let email = email, let pass = pass else { return }
        emailTextField.text = email
        passTextField.text = pass
    }
}
