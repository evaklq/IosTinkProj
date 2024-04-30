//
//  FamousArtsView.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class FamousArtsView: BaseView {
    // MARK: - UI elements
    private lazy var wecomeUserLabel = uiFactory.createLabel(type: .default, text: Strings.Title.welcomeUser)
    private lazy var searchArtTextField = uiFactory.createTextField(type: .search, placeholder: Strings.Title.mainFindTextField, action: searchAction)
    private lazy var popularArtsLabel = uiFactory.createLabel(type: .title, text: Strings.Title.popularArts)
    private lazy var popularArtsTable = createTable()

    // MARK: - Actions
    private var searchAction: UIAction?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSearchAction()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FamousArtsView {
    func setTableDataSource(_ dataSource: UITableViewDataSource) {
        popularArtsTable.dataSource = dataSource
    }
    func reloadData() {
        popularArtsTable.reloadData()
    }
}

private extension FamousArtsView {
    func createSearchAction() {
        let action = UIAction { [weak self] _ in
            // guard let self else { return }
            print("search")
        }
        searchAction = action
    }
}

// MARK: - Configure Ui
private extension FamousArtsView {
    func configureUI() {
        addSubviews([wecomeUserLabel, searchArtTextField, popularArtsLabel, popularArtsTable])
        setHeight(height: 47, views: [searchArtTextField])

        backgroundColor = Asset.Colors.back.color

        wecomeUserLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(27)
            make.top.equalToSuperview().inset(80)
        }

        searchArtTextField.snp.makeConstraints { make in
            make.top.equalTo(wecomeUserLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        popularArtsLabel.snp.makeConstraints { make in
            make.top.equalTo(searchArtTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(25)
        }

        popularArtsTable.snp.makeConstraints { make in
            make.top.equalTo(popularArtsLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().offset(20)
        }
    }
}

