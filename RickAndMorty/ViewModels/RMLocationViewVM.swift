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
    
    private var locations: [RMLocation] = []
    
    //Location response info
    // Will Contain next url, if present
    
    private var cellViewModels: [String] = []
    
    init() {}
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest,
                                 expecting: String.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.delegate?.didFetchInitialLocations()
            case .failure(let error):
                break 
            }
        }
    }
    
    private var hasMoreResults: Bool {
         return false
    }
}
