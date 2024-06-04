//
//  FavoritesView.swift
//  Woa
//
//  Created by evaklq on 2024-05-24.
//

import UIKit

class FavoritesView: BaseView {
    // MARK: - UI elements
    private lazy var favoritesLabel = uiFactory.createLabel(type: .title, text: "Your favorite arts")
    private lazy var favoritesTable = createTable()

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
extension FavoritesView {
    func setTableDataSource(_ dataSource: UITableViewDataSource) {
        favoritesTable.dataSource = dataSource
    }

    func reloadData() {
        favoritesTable.reloadData()
    }
}

// MARK: - Configure table
private extension FavoritesView {
    func configureTable() {
        favoritesTable.register(BaseViewCell.self, forCellReuseIdentifier: BaseViewCell.reuseIdentifier)
    }
}

// MARK: - Configure Ui
private extension FavoritesView {
    func configureUI() {
        let backView = UIView()
        backView.addSubview(backImage)
        backView.backgroundColor = Asset.Colors.back.color

        addSubviews([backView, favoritesLabel, favoritesTable])

        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-90)
            make.width.equalTo(260)
            make.height.equalTo(230)
        }

        favoritesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().inset(25)
        }

        favoritesTable.snp.makeConstraints { make in
            make.top.equalTo(favoritesLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
            make.bottom.equalToSuperview().offset(-80)
        }
    }
}
