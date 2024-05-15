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
