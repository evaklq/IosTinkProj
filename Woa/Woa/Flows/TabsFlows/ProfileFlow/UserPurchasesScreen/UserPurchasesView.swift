//
//  UserPurchasesView.swift
//  Woa
//
//  Created by evaklq on 2024-05-22.
//

import UIKit

class UserPurchasesView: BaseView {
    // MARK: - UI elements
    private lazy var purchasesLabel = uiFactory.createLabel(type: .title, text: "Your purchased arts")
    private lazy var purchasesArtsTable = createTable()

    private lazy var color = Asset.Colors.backDecor.color
    private lazy var decorImag = Asset.Assets.cartDecor.image.withTintColor(color)
    private lazy var backImage = UIImageView(image: decorImag)

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTable()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure table from ViewController
extension UserPurchasesView {
    func setTableDataSource(_ dataSource: UITableViewDataSource) {
        purchasesArtsTable.dataSource = dataSource
    }

    func reloadData() {
        purchasesArtsTable.reloadData()
    }
}

// MARK: - Configure table
private extension UserPurchasesView {
    func configureTable() {
        purchasesArtsTable.register(UserPurchasesViewCell.self, forCellReuseIdentifier: UserPurchasesViewCell.reuseIdentifier)
    }
}

// MARK: - Configure Ui
private extension UserPurchasesView {
    func configureUI() {
        let backView = UIView()
        backView.addSubview(backImage)
        backView.backgroundColor = Asset.Colors.back.color

        addSubviews([backView, purchasesLabel, purchasesArtsTable])

        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-90)
            make.width.equalTo(260)
            make.height.equalTo(230)
        }

        purchasesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().inset(25)
        }

        purchasesArtsTable.snp.makeConstraints { make in
            make.top.equalTo(purchasesLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().offset(-80)
        }
    }
}
