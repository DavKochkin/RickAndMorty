//
//  RMLocationViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.04.2024.
//

import UIKit


final class RMLocationViewVM {
    
    private var locations: [RMLocation] = []
    
    //Location response info
    // Will Contain next url, if present
    
    private var cellViewModels: [String] = []
    
    init() {}
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest,
                                 expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break 
            }
        }
    }
    
    private var hasMoreResults: Bool {
         return false
    }
}
