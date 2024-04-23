//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by David Kochkin on 23.04.2024.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "")
        case .contactUs:
            return UIImage(systemName: "")
        case .terms:
            return UIImage(systemName: "")
        case .privacy:
            return UIImage(systemName: "")
        case .apiReference:
            return UIImage(systemName: "")
        case .viewSeries:
            return UIImage(systemName: "")
        case .viewCode:
            return UIImage(systemName: "")
        }
    }
}
