//
//  DetailArtViewController.swift
//  Woa
//
//  Created by evaklq on 2024-05-26.
//

import UIKit

class DetailArtViewController: UIViewController, ControllerProtocol {
    var flowCompletionHandler: CompletionHandler?

    // MARK: - Private constants
    private let viewModel: DetailArtViewModel
    private let detailArtView: DetailArtView

    // MARK: - Init
    init(viewModel: DetailArtViewModel, art: Art) {
        self.viewModel = viewModel
        self.detailArtView = DetailArtView(frame: .zero, art: art)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Load view
    override func loadView() {
        view = detailArtView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
}

