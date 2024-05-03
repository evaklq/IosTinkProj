//
//  CartView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class CartView: BaseView {
    // MARK: - UI elements
    private lazy var wecomeUserLabel = uiFactory.createLabel(type: .default, text: Strings.Title.welcomeUser)
    private lazy var cartLabel = uiFactory.createLabel(type: .title, text: Strings.Title.shoppingCart)
    private lazy var artsInCartTable = createTable()
    private lazy var buyButton = uiFactory.createButton(type: .default, action: buyAction, title: Strings.Button.buy)

    private lazy var color = Asset.Colors.backDecor.color
    private lazy var decorImag = Asset.Assets.cartDecor.image.withTintColor(color)
    private lazy var backImage = UIImageView(image: decorImag)

    // MARK: - Actions
    private var buyAction: UIAction?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBuyAction()
        configureTable()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure table from ViewController
extension CartView {
    func setTableDataSource(_ dataSource: UITableViewDataSource) {
        artsInCartTable.dataSource = dataSource
    }

    func reloadData() {
        artsInCartTable.reloadData()
    }
}

// MARK: - Configure table
private extension CartView {
    func configureTable() {
        artsInCartTable.register(CartViewCell.self, forCellReuseIdentifier: CartViewCell.reuseIdentifier)
    }
}

// MARK: - Configure Actions
private extension CartView {
    func configureBuyAction() {
        let action = UIAction { [weak self] _ in
            guard let self else { return }
            print("search")
        }
        buyAction = action
    }
}

// MARK: - Configure Ui
private extension CartView {
    func configureUI() {
        let backView = UIView()
        backView.addSubview(backImage)
        backView.backgroundColor = Asset.Colors.back.color

        addSubviews([backView, wecomeUserLabel, cartLabel, artsInCartTable, buyButton])

        backView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        backImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-90)
            make.width.equalTo(260)
            make.height.equalTo(230)
        }

        wecomeUserLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(80)
        }

        cartLabel.snp.makeConstraints { make in
            make.top.equalTo(wecomeUserLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(25)
        }

        artsInCartTable.snp.makeConstraints { make in
            make.top.equalTo(cartLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().offset(-80)
        }

        buyButton.snp.makeConstraints { make in
            make.top.equalTo(artsInCartTable.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
}
