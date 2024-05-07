//
//  ProfileViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ProfileViewController: UIViewController, ControllerProtocol {
    // MARK: - Private constants
    private let viewModel: ProfileViewModel
    private let profileView: ProfileView

    // MARK: - Variables
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Init
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        self.profileView = ProfileView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
        viewModel.getUserInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = profileView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
}

// MARK: - Bindings
private extension ProfileViewController {
    func setupBindings() {
        viewModel.currentUser.bind { [weak self] (user) in
            guard let self, let user else { return }

            profileView.configureUser(name: user.nick, email: user.email)
        }

        viewModel.image.bind { [weak self] (image) in
            guard let self, let image else { return }

            profileView.configureUserImage(image: image)
        }
    }
}

