//
//  RMCharacterGender.swift
//  RickAndMorty
//
//  Created by David Kochkin on 31.03.2024.
//

import Foundation


enum RMCharacterGender: String, Codable {
    case male       = "Male"
    case female     = "Female"
    case genderless = "Genderless"
    case unknown    = "unknown"
}
