//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.03.2024.
//

import UIKit

/// /// Controller to show and search for  locations
final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
  
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch() {
        
    }
}
