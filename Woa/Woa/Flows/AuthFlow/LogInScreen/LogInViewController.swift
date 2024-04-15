//
//  LogInViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class LogInViewController: UIViewController, ControllerProtocol {
    // MARK: - Declaration objects
    var flowCompletionHandler: CompletionHandler?
    private let viewModel: LogInViewModel
    private let logInView: LogInView

    // MARK: - Init
    init(viewModel: LogInViewModel, email: String?, pass: String?) {
        self.viewModel = viewModel
        self.logInView = LogInView(frame: CGRect.zero, email: email, pass: pass)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        setupBindings()
        view = logInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        logInView.delegate = self
    }
}

// MARK: - Bindings
private extension LogInViewController {
    func setupBindings() {
        viewModel.firebaseError.bind { (errors) in
            guard let errors else { return }
            if errors.isEmpty {
                return
            }
            showSignInErrorAlert(message: errors)
        }

        viewModel.isSuccessfullyLogIn.bind { [weak self] (isSucLogIn) in
            guard let self else { return }
            if isSucLogIn ?? false {
                self.flowCompletionHandler?()
            }
        }

        func showSignInErrorAlert(message: String?) {
            guard let message = message else { return }
            let alert = logInView.getAlert(message)
            present(alert, animated: true)
        }
    }
}

// MARK: - Custom Delegate
extension LogInViewController: LogInViewDelegate {
    func didTapLogInButton(_ email: String?, _ pass: String?) {
        let user = UserData(nick: nil, email: email, password: pass, age: nil)
        viewModel.logIn(with: user)
    }
}
