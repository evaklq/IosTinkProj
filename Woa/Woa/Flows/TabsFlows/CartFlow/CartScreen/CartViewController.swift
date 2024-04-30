//
//  CartViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class CartViewController: UIViewController, ControllerProtocol {
    var flowCompletionHandler: CompletionHandler?
    private let viewModel: CartViewModel
    private let cartView: CartView
    private var cartDataSourse: CartDataSourse

    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
        self.cartView = CartView(frame: .zero)
        self.cartDataSourse = CartDataSourse()
        viewModel.getArtsFromCart()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = cartView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartView.setTableDataSource(cartDataSourse)
        cartView.reloadData()
    }
}

private extension CartViewController {
    func setupBindings() {
        viewModel.artsInCart.bind { [weak self] (arts) in
            guard let self else { return }
            guard let arts else { return }
            if arts.isEmpty {
                return
            }
            cartDataSourse.updateArts(arts)
            cartView.reloadData()
        }
    }
}
