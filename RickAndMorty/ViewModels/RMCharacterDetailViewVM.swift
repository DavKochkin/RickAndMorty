//
//  RMCharacterDetailViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 05.04.2024.
//

import UIKit


final class RMCharacterDetailViewVM {
    private let character: RMCharacter
    
    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = SectionType.allCases
    
    //MARK: - Init 
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var requestUrl: URL? {
        return URL(string: character.name)
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
