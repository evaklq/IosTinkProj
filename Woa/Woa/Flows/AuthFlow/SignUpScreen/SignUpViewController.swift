//
//  SignUpViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class SignUpViewController: UIViewController, ControllerWithValueProtocol {
    // MARK: - Declaration objects
    private let viewModel: SignUpViewModel
    private let signView: SignUpView
    var isNeedToClearErrors = Observable(false)
    var flowCompletionHandlerWithValue: CompletionHandlerWithValue<SignUpInfo>?

    // MARK: - Init
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        self.signView = SignUpView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        setupBindings()
        view = signView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signView.delegate = self
    }
}

// MARK: - Custom Delegate SignUpView
extension SignUpViewController: SignUpViewDelegate {
    func didTapRegistrationButton(_ nick: String?, _ email: String?, _ age: Int?, _ pass: String?) {
        cleanErrors()
        viewModel.regUser(nick, email, age, pass)
    }
    func didTapAlreadyRegistredButton(_ email: String?, _ pass: String?) {
        let info = SignUpInfo(accountState: .alreadyReg, email: email, pass: pass)
        flowCompletionHandlerWithValue?(info)
    }
}

// MARK: - Bindings
private extension SignUpViewController {
    func setupBindings() {
        viewModel.nickError.bind { [weak self] (errors) in
            guard let self else { return }
            guard let errors else { return }
            if errors.isEmpty {
                return
            }
            signView.configureNickErrors(errors)
        }

        viewModel.emailError.bind { [weak self] (errors) in
            guard let self else { return }
            guard let errors else { return }
            if errors.isEmpty {
                return
            }
            signView.configureEmailErrors(errors)
        }

        viewModel.passError.bind { [weak self] (errors) in
            guard let self else { return }
            guard let errors else { return }
            if errors.isEmpty {
                return
            }
            signView.configurePassErrors(errors)
        }

        viewModel.ageError.bind { [weak self] (errors) in
            guard let self else { return }
            guard let errors else { return }
            if errors.isEmpty {
                return
            }
            signView.configureAgeOrFirebaseErrors(errors)
        }

        viewModel.firebaseError.bind { [weak self] (errors) in
            guard let self else { return }
            guard let errors else { return }
            if errors.isEmpty {
                return
            }
            showSignInErrorAlert(message: errors)
        }

        viewModel.isSuccessfullySignUp.bind { [weak self] (isSucSignUp) in
            guard let self else { return }
            if isSucSignUp ?? false {
                let info = SignUpInfo(accountState: .needReg)
                self.flowCompletionHandlerWithValue?(info)
            }
        }
    }

    func showSignInErrorAlert(message: String) {
        let alert = signView.getAlert(message)
        present(alert, animated: true)
    }

    func cleanErrors() {
        signView.hideTextFieldsErrors()
    }
}

