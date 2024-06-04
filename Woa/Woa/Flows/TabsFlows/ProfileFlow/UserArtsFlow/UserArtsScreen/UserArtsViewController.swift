//
//  UserArtsViewController.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import UIKit

class UserArtsViewController: UIViewController, ControllerProtocol {
    // MARK: - Private constants
    private let viewModel: UserArtsViewModel
    private let userArtsView: UserArtsView
    private var sellingDataSourse: SellingArtsDataSourse
    private var archiveDataSourse: ArchiveArtsDataSourse

    // MARK: - Variables
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Init
    init(viewModel: UserArtsViewModel) {
        self.viewModel = viewModel
        self.userArtsView = UserArtsView(frame: .zero)
        self.sellingDataSourse = SellingArtsDataSourse()
        self.archiveDataSourse = ArchiveArtsDataSourse()
        super.init(nibName: nil, bundle: nil)
        viewModel.getUserArts()
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userArtsView.setTableDataSources(sellingDataSourse, archiveDataSourse)
        userArtsView.reloadData()
    }
}

// MARK: - Bindings
private extension UserArtsViewController {
    func setupBindings() {
        viewModel.userArts.bind { [weak self] (arts) in
            guard let self, let arts else { return }

            if arts.isEmpty {
                return
            }
            sellingDataSourse.updateArts(arts)
            archiveDataSourse.updateArts(arts)
            userArtsView.reloadData()
        }
    }
}
