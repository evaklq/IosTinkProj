//
//  ProfileViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class ProfileViewController: UIViewController, ControllerWithValueProtocol {
    var flowCompletionHandlerWithValue: CompletionHandlerWithValue<ProfileActions>?
    typealias ResultValue = ProfileActions

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
        profileView.delegate = self
        edgesForExtendedLayout = .top
    }
}

// MARK: - Custom Delegate SignUpView
extension ProfileViewController: ProfileViewDelegate {
    func didTapArtsLabel() {
        flowCompletionHandlerWithValue?(.userArts)
    }
    
    func didTapChangeProfileLabel() {
        flowCompletionHandlerWithValue?(.changeProfile)
    }

    func didTapPurchasesLabel() {
        flowCompletionHandlerWithValue?(.purchases)
    }

    func didTapFavoritesLabel() {
        flowCompletionHandlerWithValue?(.favorites)
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

        viewModel.update.bind { [weak self] (image) in
            guard let self, let image else { return }
        }
    }
}

