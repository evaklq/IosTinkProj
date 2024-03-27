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
    init(viewModel: LogInViewModel) {
        self.viewModel = viewModel
        self.logInView = .init()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = logInView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logInView.delegate = self
    }
}

// MARK: - Custom Delegate
extension LogInViewController: LogInViewDelegate {
    func didPressLogIn(_ nick: String?, _ pass: String?) {
        // TODO: - check data
        flowCompletionHandler?()
    }
}
