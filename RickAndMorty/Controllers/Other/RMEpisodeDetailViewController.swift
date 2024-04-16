//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 16.04.2024.
//

import UIKit

/// VC to show details about single episode!
final class RMEpisodeDetailViewController: UIViewController {
    
    private let url: URL?
    
    //MARK: - Init

    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        
        view.backgroundColor = .systemGreen
    }
}
