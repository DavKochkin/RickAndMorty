//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.03.2024.
//

import UIKit

/// /// Controller to show and search for  locations
final class RMLocationViewController: UIViewController, RMLocationViewVMDelegate {
    
    private let primaryView = RMLocationView()
  
    private let viewModel = RMLocationViewVM()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchLocations()
    }
  
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(didTapSearch))
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func didTapSearch() {
        
    }
    
    //MARK: - LocationViewModel Delegate
    
    func didFetchInitialLocations() {
        primaryView.configure(with: viewModel)
    }
}
