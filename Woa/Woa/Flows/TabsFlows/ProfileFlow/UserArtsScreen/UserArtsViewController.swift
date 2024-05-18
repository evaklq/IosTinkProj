//
//  UserArtsViewController.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import UIKit

class UserArtsViewController: UIViewController, ControllerWithValueProtocol {
    var flowCompletionHandlerWithValue: CompletionHandlerWithValue<ProfileActions>?
    typealias ResultValue = ProfileActions

    // MARK: - Private constants
    private let viewModel: UserArtsViewModel
    private let userArtsView: UserArtsView

    // MARK: - Variables
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Init
    init(viewModel: UserArtsViewModel) {
        self.viewModel = viewModel
        self.userArtsView = UserArtsView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
        viewModel.getUserInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = userArtsView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
}

// MARK: - Bindings
private extension UserArtsViewController {
    func setupBindings() {
        viewModel.currentUser.bind { [weak self] (user) in
            guard let self, let user else { return }

            userArtsView.configureUser(name: user.nick, email: user.email)
        }

        viewModel.image.bind { [weak self] (image) in
            guard let self, let image else { return }

            userArtsView.configureUserImage(image: image)
        }
    }
}



