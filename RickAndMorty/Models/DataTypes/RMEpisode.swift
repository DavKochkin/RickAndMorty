//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.03.2024.
//

import Foundation


struct RMEpisode: Codable {
    let id:         Int
    let name:       String
    let air_date:   String
    let episdoe:    String
    let characters: [String]
    let url:        String
    let created:    String
}
