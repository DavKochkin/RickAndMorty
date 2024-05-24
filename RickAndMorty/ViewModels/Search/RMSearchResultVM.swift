//
//  RMSearchResultVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 19.05.2024.
//

import Foundation

enum RMSearchResultVM {
    case characters([RMCharacterCollectionViewCellVM])
    case episodes([RMCharacterEpisodeCollectionViewCellVM])
    case locations([RMLocationTableViewCellVM])
}
