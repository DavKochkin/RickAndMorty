//
//  RMSearchViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 07.05.2024.
//

import Foundation


final class RMSearchViewVM {
    let config: RMSearchViewController.Config
    private var optionMap: [RMSearchInputViewVM.DynamicOption: String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchInputViewVM.DynamicOption, String)) -> Void)?
    
    //MARK: - Init
    
    init(config: RMSearchViewController.Config){
        self.config = config
    }
    
    //MARK: - Public
    
    public func executeSearch() {
        // Create Request based on Filters
        // https://rickandmorty.com/api/character/?name=rick&status=alive
        
        switch config.type {
        case .character:
            searchText = "Rick"
            
            var queryParams = [URLQueryItem(name: "name", value: searchText)]
            queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
                let key: RMSearchInputViewVM.DynamicOption = element.key
                let value: String = element.value
                return URLQueryItem(name: key.queryArgument, value: value)
            }))
            
            let request = RMRequest(
                endpoint: .character,
                queryParameters: queryParams
            )
            
            RMService.shared.execute(request, expecting: RMGetCharacterResponse.self) { result in
                switch result {
                case .success(let model):
                    print("Search results found: \(model.results.count)")
                case .failure(let error):
                    break
                }
            }
            
        case .episode:
            <#code#>
        case .location:
            <#code#>
        }
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewVM.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }
    
    public func registerOptionChangeBlock(
        _ block: @escaping ((RMSearchInputViewVM.DynamicOption, String)) -> Void
    ) {
        self.optionMapUpdateBlock = block
    }
}
