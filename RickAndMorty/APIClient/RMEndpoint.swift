//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by David Kochkin on 31.03.2024.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}


