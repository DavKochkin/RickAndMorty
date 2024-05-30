//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by David Kochkin on 07.05.2024.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmSearchView(_ searchView: RMSearchView, didSelectOption option: RMSearchInputViewVM.DynamicOption)
    
    func rmSearchView(_ searchView: RMSearchView, didSelectLocation location: RMLocation)
}

final class RMSearchView: UIView {
    
    weak var delegate: RMSearchViewDelegate?
    
    private let viewModel:  RMSearchViewVM
    
    // MARK: - Subviews
    
    private let searchInputView = RMSearchInputView()
    private let noResultsView   = RMNoSearchResultView()
    private let resultsView     = RMSearchResultsView()
    
    
    //MARK: - Init

    init(frame: CGRect, viewModel: RMSearchViewVM) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(resultsView ,noResultsView, searchInputView)
        addConstraints()
        
        searchInputView.configure(with: RMSearchInputViewVM(type: viewModel.config.type))
        searchInputView.delegate = self
        
        setUpHandlers(viewModel: viewModel)
        
        resultsView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpHandlers(viewModel: RMSearchViewVM) {
        viewModel.registerOptionChangeBlock { tuple in
            self.searchInputView.update(option: tuple.0, value: tuple.1)
        }
        
        viewModel.registerSearchResultHandler { [weak self] results in
            DispatchQueue.main.async  {
                self?.resultsView.configure(with: results)
                self?.noResultsView.isHidden = true
                self?.resultsView.isHidden   = false
            }
        }
        
        viewModel.registerNoResultsHandler { [weak self] in
            DispatchQueue.main.async  {
                self?.noResultsView.isHidden = false
                self?.resultsView.isHidden   = true
            }
        }
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // Search input View
            searchInputView.topAnchor.constraint(equalTo: topAnchor),
            searchInputView.leftAnchor.constraint(equalTo: leftAnchor),
            searchInputView.rightAnchor.constraint(equalTo: rightAnchor),
            searchInputView.heightAnchor.constraint(equalToConstant: viewModel.config.type == .episode ? 55 : 110),
            
            // Results View
            resultsView.topAnchor.constraint(equalTo: searchInputView.bottomAnchor),
            resultsView.leftAnchor.constraint(equalTo: leftAnchor),
            resultsView.rightAnchor.constraint(equalTo: rightAnchor),
            resultsView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //No Results
            noResultsView.widthAnchor.constraint(equalToConstant: 150),
            noResultsView.heightAnchor.constraint(equalToConstant: 150),
            noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    public func presentKeyboard() {
        searchInputView.presentKeyboard()
    }
}


//MARK: - CollectionView

extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}


extension RMSearchView: RMSearchInputViewDelegate {
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewVM.DynamicOption) {
        delegate?.rmSearchView(self, didSelectOption: option)
    }
    
    func rmSearchInputView(_ inputView: RMSearchInputView, didChangeSearchText text: String) {
        viewModel.set(query: text)
    }
    
    func rmSearchInputViewDidTapSearchKeyboardButton(_ inputView: RMSearchInputView) {
        viewModel.executeSearch()
    }
}


extension RMSearchView: RMSearchResultsViewDelegate {
    func rmSearchResultView(_ resultsView: RMSearchResultsView, didTapLocationAt index: Int) {
        guard let locationModel = viewModel.locationSearchResult(at: index) else {
            return
        }
        delegate?.rmSearchView(self, didSelectLocation: locationModel)
    }
}
