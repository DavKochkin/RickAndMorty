//
//  RMCharacterInfoCollectionViewCellVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 14.04.2024.
//

import Foundation
import UIKit


final class RMCharacterInfoCollectionViewCellVM {
    private let type: `Type`
    private let value: String
    
    public var title: String {
        type.displayTitle
    }
    
    public var displayValue: String {
        if value.isEmpty { return "None" }
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    enum `Type` {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemBlue
            case .gender:
                return .systemRed
            case .type:
                return .systemCyan
            case .species:
                return .systemOrange
            case .origin:
                return .systemGreen
            case .created:
                return .systemYellow
            case .location:
                return .systemCyan
            case .episodeCount:
                return .systemMint
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
        
        var displayTitle: String {
            
            switch self {
            case .status:
                return "Something"
            case .gender:
                return "Something"
            case .type:
                return "Something"
            case .species:
                return "Something"
            case .origin:
                return "Something"
            case .created:
                return "Something"
            case .location:
                return "Something"
            case .episodeCount:
                return "Something"
            }
        }
    }
 
    init(type: `Type`, value: String) {
        self.value = value
        self.type  = type
    }
}
