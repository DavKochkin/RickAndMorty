//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 05.04.2024.
//

import UIKit


/// Controller to show info about single character
final class RMCharacterDetailViewController: UIViewController {
    private let viewModel: RMCharacterDetailViewVM
    
    private let detailView = RMCharacterDetailView()
    
    init(viewModel: RMCharacterDetailViewVM ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare)
        )
        addCosntraints()
    }
    
    
    @objc private func didTapShare() {
        // Share character info
    }
    
    
    private func addCosntraints()  {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
