//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 05.04.2024.
//

import UIKit


/// Controller to show info about single character
final class RMCharacterDetailViewController: UIViewController {

    init(viewModel: RMCharacterDetailViewVM ) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
