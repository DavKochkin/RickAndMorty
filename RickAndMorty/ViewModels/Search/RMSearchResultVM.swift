//
//  RMSearchResultVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 19.05.2024.
//

import Foundation

final class RMSearchResultViewModel {
    public private(set) var results: RMSearchResultType
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
    
    public func fetchAdditionalLocations(completion: @escaping ([RMLocationTableViewCellVM]) -> Void)  {
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
                strongSelf.next = info.next // Capture new pagination url
                
                let additionalLocations = moreResults.compactMap({
                    return RMLocationTableViewCellVM(location: $0)
                })
                
                var newResults: [RMLocationTableViewCellVM] = []
                
                switch strongSelf.results {
                case .locations(let existingResults):
                    newResults = existingResults + additionalLocations
                    strongSelf.results = .locations(newResults)
                    break
                case .characters, .episodes:
                    break
                }
                
                DispatchQueue.main.async {
                    strongSelf.isLoadingMoreResults = false
                    
                    // Notify via callback
                    completion(newResults)
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
