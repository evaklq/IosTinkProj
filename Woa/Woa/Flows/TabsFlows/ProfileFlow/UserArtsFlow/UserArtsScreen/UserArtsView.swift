//
//  UserArtsView.swift
//  Woa
//
//  Created by evaklq on 2024-05-08.
//

import UIKit

class UserArtsView: BaseView {
    // MARK: - UI elements
    private lazy var sellingArtsLabel = uiFactory.createLabel(type: .title, text: "Your arts for sale")
    private lazy var sellingArtsTable = createTable()
    private lazy var archiveArtsLabel = uiFactory.createLabel(type: .title, text: "Your arts in the archive")
    private lazy var archiveArtsTable = createTable()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTables()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure table from ViewController
extension UserArtsView {
    func setTableDataSources(_ sellingDS: UITableViewDataSource, _ archiveDS: UITableViewDataSource) {
        sellingArtsTable.dataSource = sellingDS
        archiveArtsTable.dataSource = archiveDS
    }

    func reloadData() {
        sellingArtsTable.reloadData()
        archiveArtsTable.reloadData()
    }
}

// MARK: - Configure table
private extension UserArtsView {
    func configureTables() {
        sellingArtsTable.register(UserArtsViewCell.self, forCellReuseIdentifier: UserArtsViewCell.reuseIdentifier)
        archiveArtsTable.register(UserArtsViewCell.self, forCellReuseIdentifier: UserArtsViewCell.reuseIdentifier)
    }
}

// MARK: - Configure Ui
private extension UserArtsView {
    func configureUI() {
        backgroundColor = Asset.Colors.back.color

        addSubviews([sellingArtsLabel, sellingArtsTable, archiveArtsLabel, archiveArtsTable])

        sellingArtsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().inset(25)
        }

        sellingArtsTable.snp.makeConstraints { make in
            make.top.equalTo(sellingArtsLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(230)
        }

        archiveArtsLabel.snp.makeConstraints { make in
            make.top.equalTo(sellingArtsTable.snp.bottom).offset(40)
            make.leading.equalToSuperview().inset(25)
        }

        archiveArtsTable.snp.makeConstraints { make in
            make.top.equalTo(archiveArtsLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.height.equalTo(300)
        }
    }
}
