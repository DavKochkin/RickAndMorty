//
//  RMSettingsViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.03.2024.
//

import UIKit

/// /// Controller to show various app options and settingsk
final class RMSettingsViewController: UIViewController {
    
    private let viewModel = RMSettingsViewVM(
        cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellVM(type: $0)
        })
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
    }

}
