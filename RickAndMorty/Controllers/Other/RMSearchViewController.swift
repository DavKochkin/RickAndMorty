//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 17.04.2024.
//

import UIKit

/// Configurable controller to search
class RMSearchViewController: UIViewController {
    
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character // name | status | gender 
            case episode // name
            case location // name | type
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Locations"
                case .episode:
                    return "Search Episodes"
                }
            }
        }
        
        let type: `Type`
    }
    
    private let viewModel: RMSearchViewVM
    private let searchView: RMSearchView
    
    //MARK:  - Init
    
    init(config: Config) {
        let viewModel   = RMSearchViewVM(config: config)
        self.viewModel  = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        view.addSubview(searchView)
        addConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapExecuteSearch))
    }
    
    
    @objc
    private func didTapExecuteSearch() {
//        viewModel.executeSearch()
    }
    
    private func addConstraints()  {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
