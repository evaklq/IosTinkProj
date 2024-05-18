//
//  ChangeProfileViewController.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import UIKit

class ChangeProfileViewController: UIViewController, ControllerProtocol, ChangeProfileViewDelegate {
    // MARK: - Private constants
    private let viewModel: ChangeProfileViewModel
    private let changeProfileView: ChangeProfileView

    // MARK: - Variables
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Init
    init(viewModel: ChangeProfileViewModel) {
        self.viewModel = viewModel
        self.changeProfileView = ChangeProfileView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
        viewModel.getUserInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = changeProfileView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        changeProfileView.delegate = self
        edgesForExtendedLayout = .top
    }

    func didTapStartToBeAuthorLabel() {
        viewModel.startToBeAuthor()
    }
}

// MARK: - Bindings
private extension ChangeProfileViewController {
    func setupBindings() {
        viewModel.currentUser.bind { [weak self] (user) in
            guard let self, let user else { return }

            changeProfileView.configureUser(name: user.nick, email: user.email)
        }

        viewModel.image.bind { [weak self] (image) in
            guard let self, let image else { return }

            changeProfileView.configureUserImage(image: image)
        }
    }
}


