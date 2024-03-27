//
//  SignUpView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit
import SnapKit

protocol SignUpViewDelegate: AnyObject {
    func didPressReg(_ nick: String?, _ email: String?, _ age: Int?, _ pass: String?)
    func didPressAlreadyReg(_ nick: String?, _ pass: String?)
}

class SignUpView: BaseView {
    // MARK: - Declaration Objects
    private lazy var backImage: UIImageView = UIImageView(image: Asset.Assets.authDecor.image.withTintColor(Asset.Colors.backDecor.color))
    private lazy var nickTextField = createDefaultTextField(Strings.nick)
    private lazy var nickErrorsLabel = createErrorLabel()
    private lazy var passTextField = createDefaultTextField(Strings.pass)
    private lazy var passErrorsLabel = createErrorLabel()
    private lazy var emailTextField = createDefaultTextField(Strings.email)
    private lazy var emailErrorsLabel = createErrorLabel()
    private lazy var ageTextField = createDefaultTextField(Strings.age)
    private lazy var ageErrorsLabel = createErrorLabel()

    private lazy var regButton = createDefaultButton(Strings.authButton, regAction)
    private lazy var alreadyRegButton = createTextButton(Strings.alreadyRegButton, alreadyRegAction)

    private var regAction = UIAction { _ in }
    private var alreadyRegAction = UIAction { _ in }

    weak var delegate: SignUpViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureActions()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure Actions
extension SignUpView {
    private func configureActions() {
        regAction = createRegAction()
        alreadyRegAction = createAlreadyRegAction()
    }

    private func createRegAction() -> UIAction {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            let age = Int(self.ageTextField.text ?? "")
            self.delegate?.didPressReg(self.nickTextField.text, self.emailTextField.text, age, self.passTextField.text)
        }
        return action
    }

    private func createAlreadyRegAction() -> UIAction {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.didPressAlreadyReg(self.nickTextField.text, self.passTextField.text)
        }
        return action
    }
}

// MARK: - Configure Constrains
extension SignUpView {
    private func configureUI() {
        let backView = UIView()
        backView.addSubview(backImage)
        backView.backgroundColor = Asset.Colors.back.color

        let textFields = [nickTextField, passTextField, emailTextField, emailTextField, ageTextField]
        let textFieldsStackView = UIStackView(arrangedSubviews: textFields)

        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 30

        addSubviews([backView, textFieldsStackView, nickErrorsLabel, passErrorsLabel, emailErrorsLabel, ageErrorsLabel, regButton, alreadyRegButton])

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
        setErrors(label: emailErrorsLabel, textFiled: emailTextField)
        setErrors(label: ageErrorsLabel, textFiled: ageTextField)

        regButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(ageErrorsLabel.snp.bottom).offset(33)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }

        alreadyRegButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(regButton.snp.bottom).offset(14)
        }
    }
}
