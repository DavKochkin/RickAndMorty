//
//  RMSearchResultsView.swift
//  RickAndMorty
//
//  Created by David Kochkin on 25.05.2024.
//

import UIKit

/// Shows search results UI (table or collection as needed)
final class RMSearchResultsView: UIView {
    
    private var viewModel: RMSearchResultVM? {
        didSet {
            self.processViewModel()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(RMLocationTableViewCell.self,
                       forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        table.isHidden = true
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(tableView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func processViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        switch viewModel {
        case .characters(let viewModels):
            setupCollectionView()
        case .episodes(let viewModels):
            setUpTableView()
        case .locations(let viewModels):
            setupCollectionView()
        }
    }
    
    
    private func setupCollectionView() {
        
    }
    
    
    private func setUpTableView() {
        tableView.isHidden = false
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    public func configure(with viewModel: RMSearchResultVM) {
        
    }
}
