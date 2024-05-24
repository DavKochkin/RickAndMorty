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
    
    private var searchResultHandler: ((RMSearchResultVM) -> Void)?
    
    //MARK: - Init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    //MARK: - Public
    
    public func registerSearchResultHandler(_ block: @escaping (RMSearchResultVM) -> Void) {
        self.searchResultHandler = block
    }
    
    public func executeSearch() {
        print("Search text: \(searchText)")
        
        // Build arguments
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        ]
        
        // Add options
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchInputViewVM.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        // Create request
        let request = RMRequest(
            endpoint: config.type.endpoint,
            queryParameters: queryParams
        )
        
        switch config.type.endpoint {
        case .character:
            makeSearchAPICall(RMGetCharacterResponse.self, request: request)
        case .location:
            makeSearchAPICall(RMGetAllLocationsResponse.self, request: request)
        case .episode:
            makeSearchAPICall(RMGetAllEpisodesResponse.self, request: request)
        }
    }
    
    private func makeSearchAPICall<T: Codable>(_ type: T.Type, request: RMRequest ) {
        RMService.shared.execute(request, expecting: type) { [weak self] result in
            // Notify view of results, no results or error
            
            switch result {
            case .success(let model):
                self?.processSearchResults(model: model)
            case .failure:
                break
            }
        }
    }
    
    private func processSearchResults(model: Codable) {
        var resultsVM: RMSearchResultVM?
        if let characterResults    = model as? RMGetCharacterResponse {
            resultsVM = .characters(characterResults.results.compactMap({
                return RMCharacterCollectionViewCellVM(
                    characterName: $0.name,
                    characterStatus: $0.status,
                    characterImageUrl: URL(string: $0.image)
                )
            })
            )
        }
        else if let episodesResult = model as? RMGetAllEpisodesResponse {
            resultsVM = .episodes(episodesResult.results.compactMap({
                return RMCharacterEpisodeCollectionViewCellVM(
                    episodeDataUrl: URL(string: $0.url)
                )
            })
            )
        }
        else if let locationResult = model as? RMGetAllLocationsResponse {
            resultsVM = .locations(locationResult.results.compactMap({
                return RMLocationTableViewCellVM(location: $0)
            }))
        }
        
        if let results = resultsVM {
            self.searchResultHandler?(results)
        } else {
            // fallback error
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
