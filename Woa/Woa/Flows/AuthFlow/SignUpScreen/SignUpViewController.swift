//
//  SignUpViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class SignUpViewController: UIViewController, ControllerWithValueProtocol {
    // MARK: - Declaration objects
    var flowCompletionHandlerWithValue: CompletionHandlerWithValue<UserAccountStatus>?
    private let viewModel: SignUpViewModel
    private let signView: SignUpView

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
        view = SignUpView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        signView.delegate = self
    }
}

// MARK: - Custom Delegate
extension SignUpViewController: SignUpViewDelegate {
    func didPressReg(_ nick: String?, _ email: String?, _ age: Int?, _ pass: String?) {
        // TODO: - check data
        flowCompletionHandlerWithValue?(.needReg)
    }
    func didPressAlreadyReg(_ nick: String?, _ pass: String?) {
        // TODO: - send  written data to next controller
        flowCompletionHandlerWithValue?(.alreadyReg)
    }
}

