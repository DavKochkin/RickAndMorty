//
//  RMSettingsCellVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 23.04.2024.
//

import UIKit


struct RMSettingsCellVM: Identifiable, Hashable {
    var id = UUID()
    
    private let type: RMSettingsOption
    
    //MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    //MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
