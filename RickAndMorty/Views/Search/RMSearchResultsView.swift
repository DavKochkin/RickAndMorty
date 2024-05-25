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
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
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
            break
        case .episodes(let viewModels):
            break
        case .locations(let viewModels):
            break
        }
    }
    
    
    private func addConstraints() {
        
    }
    
    
    public func configure(with viewModel: RMSearchResultVM) {
        
    }
}
