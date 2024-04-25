//
//  RMSettingsViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 30.03.2024.
//
import SwiftUI
import UIKit

/// /// Controller to show various app options and settingsk
final class RMSettingsViewController: UIViewController {
    
    private let settingsSwiftUIController = UIHostingController(
        rootView: RMSettingsView(
            viewModel:  RMSettingsViewVM(
                cellViewModels: RMSettingsOption.allCases.compactMap({
                    return RMSettingsCellVM(type: $0)
                })
            )
        )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        addSwiftUIController()
    }
    
    private func addSwiftUIController() {
        addChild(settingsSwiftUIController)
        settingsSwiftUIController.didMove(toParent: self)
        
        view.addSubview(settingsSwiftUIController.view)
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
