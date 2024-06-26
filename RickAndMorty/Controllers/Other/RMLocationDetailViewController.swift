//
//  RMLocationDetailViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 05.05.2024.
//

import UIKit

class RMLocationDetailViewController: UIViewController, RMLocationDetailViewVMDelegate, RMLocationDetailViewDelegate {
  
    private let viewModel: RMLocationDetailViewVM
    
    private let detailView = RMLocationDetailView() 
    
    //MARK: - Init

    init(location: RMLocation) {
        let url = URL(string: location.url)
        self.viewModel = RMLocationDetailViewVM(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        addConstraints()
        detailView.delegate = self
        title = "Location"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(didTapShare))
        
        viewModel.delegate = self
        viewModel.fetchLocationData()
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func didTapShare() {
        
    }
    
    //MARK: - View Delegat
    
    func rmLocationDetailView(_ detailView: RMLocationDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailViewController(viewModel: .init(character: character))
        vc.title = character.name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - ViewModel Delegate
    
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }
}

