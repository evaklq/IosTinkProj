//
//  LogInViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class LogInViewController: UIViewController, ControllerProtocol {

    var flowCompletionHandler: CompletionHandler?
    private let viewModel: LogInViewModel

    init(viewModel: LogInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
