//
//  RMSearchResultVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 19.05.2024.
//

import Foundation

final class RMSearchResultViewModel {
    let results: RMSearchResultType
    private var next: String?
    
    init(results: RMSearchResultType, next: String?, isLoadingMoreResults: Bool = false) {
        self.results = results
        self.next    = next
        self.isLoadingMoreResults = isLoadingMoreResults
    }
    
    public private(set) var isLoadingMoreResults = false
    
    public var shouldShowLoadMoreIndicator: Bool {
        return next != nil 
    }
    
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreResults else {
            return
        }
        
        guard let nextUrlString = next,
              let url = URL(string: nextUrlString) else {
            return
        }
        
        isLoadingMoreResults = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreResults = false
            return
        }
        RMService.shared.execute(request, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let responseModel):
                let moreResults    = responseModel.results
                let info           = responseModel.info
                print("more locations \(moreResults.count)")
                strongSelf.next = info.next // Capture new pagination url
//                strongSelf.cellViewModels.append(contentsOf: moreResults.compactMap({
//                    return RMLocationTableViewCellVM(location: $0)
//                }))
                DispatchQueue.main.async {
                    strongSelf.isLoadingMoreResults = false
                    
                    // Notify via callback
//                    strongSelf.didFinishPagination?()
                }
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreResults = false
            }
        }
    }
}

enum RMSearchResultType {
    case characters([RMCharacterCollectionViewCellVM])
    case episodes([RMCharacterEpisodeCollectionViewCellVM])
    case locations([RMLocationTableViewCellVM])
}
