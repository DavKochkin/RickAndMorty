//
//  RMCharacterDetailViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 05.04.2024.
//

import UIKit


final class RMCharacterDetailViewVM {
    private let character: RMCharacter
    
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
