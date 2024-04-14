//
//  RMCharacterInfoCollectionViewCellVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 14.04.2024.
//

import Foundation


final class RMCharacterInfoCollectionViewCellVM {
    public let value: String
    public let title: String
    
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
        
    }
}
