//
//  SignUpViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class SignUpViewController: UIViewController, ControllerWithValueProtocol {

    var flowCompletionHandlerWithValue: CompletionHandlerWithValue<UserAccountStatus>?
    private let viewModel: SignUpViewModel

    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

