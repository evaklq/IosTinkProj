//
//  SignUpView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit
import SnapKit

protocol SignUpViewDelegate: AnyObject {
    func didTapRegistrationButton(_ nick: String?, _ email: String?, _ age: Int?, _ pass: String?)
    func didTapAlreadyRegistredButton(_ email: String?, _ pass: String?)
}

class SignUpView: BaseView {
    // MARK: - UI elements
    private lazy var nickTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.nick)
    private lazy var passTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.pass)
    private lazy var emailTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.email)
    private lazy var ageTextField = uiFactory.createTextField(type: .default, placeholder: Strings.Title.age)

    private lazy var regButton = uiFactory.createButton(type: .default, action: regAction, title: Strings.Button.auth)
    private lazy var alreadyRegButton = uiFactory.createButton(type: .text, action: alreadyRegAction, title: Strings.Button.alreadyReg)

    private lazy var nickErrorsLabel = uiFactory.createLabel(type: .error)
    private lazy var passErrorsLabel = uiFactory.createLabel(type: .error)
    private lazy var emailErrorsLabel = uiFactory.createLabel(type: .error)
    private lazy var ageErrorsLabel = uiFactory.createLabel(type: .error)

    private lazy var backColor = Asset.Colors.backDecor.color
    private lazy var image = Asset.Assets.authDecor.image.withTintColor(backColor)
    private lazy var backImage = UIImageView(image: image)

    private var regAction: UIAction?
    private var alreadyRegAction: UIAction?

    // MARK: - Variables
    weak var delegate: SignUpViewDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureRegAction()
        configureAlreadyRegAction()
        configureUI()
        emailTextField.text = "missis.1220@mail.ru"
        passTextField.text = "Evaklq1!!"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure errors from controller
extension SignUpView {
    func configureNickErrors(_ errors: String?) {
        nickErrorsLabel.isHidden = false
        nickErrorsLabel.text = errors
    }
    func configureEmailErrors(_ errors: String?) {
        emailErrorsLabel.isHidden = false
        emailErrorsLabel.text = errors
    }
    func configurePassErrors(_ errors: String?) {
        passErrorsLabel.isHidden = false
        passErrorsLabel.text = errors
    }
    func configureAgeOrFirebaseErrors(_ errors: String?) {
        ageErrorsLabel.isHidden = false
        ageErrorsLabel.text = errors
    }
    func hideTextFieldsErrors() {
        nickErrorsLabel.text = ""
        emailErrorsLabel.text = ""
        passErrorsLabel.text = ""
        ageErrorsLabel.text = ""
    }
    func getAlert(_ mes: String) -> UIAlertController {
        uiFactory.createAlert(type: .error, message: mes)
    }
}

// MARK: - Configure Actions
private extension SignUpView {
    func configureRegAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            let age = Int(self.ageTextField.text ?? "-1")
            self.delegate?.didTapRegistrationButton(self.nickTextField.text, self.emailTextField.text, age, self.passTextField.text)
        }
        regAction = action
    }

    func configureAlreadyRegAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            self.delegate?.didTapAlreadyRegistredButton(self.emailTextField.text, self.passTextField.text)
        }
        alreadyRegAction = action
    }
}

// MARK: - Configure UI
private extension SignUpView {
    func configureUI() {
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
