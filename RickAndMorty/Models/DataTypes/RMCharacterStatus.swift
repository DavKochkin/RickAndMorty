//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by David Kochkin on 31.03.2024.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    // Alive, Dead, unknown
    case alive   = "Alive"
    case dead    = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
