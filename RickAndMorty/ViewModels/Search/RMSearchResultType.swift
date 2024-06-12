//
//  RMSearchResultVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 19.05.2024.
//

import Foundation

struct RMSearchResultViewModel {
    let results: RMSearchResultType
}

enum RMSearchResultType {
    case characters([RMCharacterCollectionViewCellVM])
    case episodes([RMCharacterEpisodeCollectionViewCellVM])
    case locations([RMLocationTableViewCellVM])
}
