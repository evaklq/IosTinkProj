//
//  UserPurchasesController.swift
//  Woa
//
//  Created by evaklq on 2024-05-22.
//

import UIKit

class UserPurchasesController: UIViewController, ControllerProtocol {
    var flowCompletionHandler: CompletionHandler?
    private let viewModel: UserPurchasesViewModel
    private let userPurchasesView: UserPurchasesView
    private var userPurchasesDataSourse: UserPurchasesDataSourse

    init(viewModel: UserPurchasesViewModel) {
        self.viewModel = viewModel
        self.userPurchasesView = UserPurchasesView(frame: .zero)
        self.userPurchasesDataSourse = UserPurchasesDataSourse()
        viewModel.getPurchases()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = userPurchasesView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userPurchasesView.setTableDataSource(userPurchasesDataSourse)
        userPurchasesView.reloadData()
    }
}

private extension UserPurchasesController {
    func setupBindings() {
        viewModel.purchases.bind { [weak self] (orders) in
            guard let self else { return }
            guard let orders else { return }
            if orders.isEmpty {
                return
            }
            userPurchasesDataSourse.updateOrders(orders)
            userPurchasesView.reloadData()
        }
    }
}

