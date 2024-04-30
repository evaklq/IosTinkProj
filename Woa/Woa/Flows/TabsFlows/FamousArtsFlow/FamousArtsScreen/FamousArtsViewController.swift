//
//  FamousArtsViewController.swift
//  Woa
//
//  Created by Mac on 2024-03-19.
//

import UIKit

class FamousArtsViewController: UIViewController, ControllerProtocol {
    var flowCompletionHandler: CompletionHandler?
    private let viewModel: FamousArtsViewModel
    private let famousArtsView: FamousArtsView
    private var famousArtsDataSourse: FamousArtsDataSourse

    init(viewModel: FamousArtsViewModel) {
        self.viewModel = viewModel
        self.famousArtsView = FamousArtsView(frame: .zero)
        self.famousArtsDataSourse = FamousArtsDataSourse()
        viewModel.getPopularArts()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = famousArtsView
        setupBindings()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        famousArtsView.setTableDataSource(famousArtsDataSourse)
        famousArtsView.reloadData()
    }
}

private extension FamousArtsViewController {
    func setupBindings() {
        viewModel.popularArts.bind { [weak self] (arts) in
            guard let self else { return }
            guard let arts else { return }
            if arts.isEmpty {
                return
            }
            famousArtsDataSourse.updateArts(arts)
            famousArtsView.reloadData()
        }
    }
}

