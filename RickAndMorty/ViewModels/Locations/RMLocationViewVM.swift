//
//  RMLocationViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.04.2024.
//

import UIKit

protocol RMLocationViewVMDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewVM {
    
    weak var delegate: RMLocationViewVMDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellVM(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    //Location response info
    // Will Contain next url, if present
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellVM] = []
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocations = false 
    
    //MARK: - Init
    
    init() {}
    
    // Paginate if additional locations are needed
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocations else {
            return
        }
        isLoadingMoreLocations = true
        
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
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
//                strongSelf.apiInfo = info
//
//                let originalCount  = strongSelf.episodes.count
//                let newCount       = moreResults.count
//                let total          = originalCount+newCount
//                let startingIndex  = total - newCount
//                let indexPathsToAdd: [IndexPath] = Array(startingIndex..<(startingIndex+newCount)).compactMap({
//                    return IndexPath(row: $0, section: 0)
//                })
//                strongSelf.episodes.append(contentsOf: moreResults)
//
//                DispatchQueue.main.async {
//                    strongSelf.delegate?.didLoadMoreEpisodes(
//                        with: indexPathsToAdd
//                    )
//
//                    strongSelf.isLoadingMoreEpisodes = false
//                }
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreLocations = false
            }
        }
    }
    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            .listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo   = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure(let error):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
