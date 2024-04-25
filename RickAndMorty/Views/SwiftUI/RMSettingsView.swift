//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by David Kochkin on 23.04.2024.
//

import SwiftUI

struct RMSettingsView: View {
    let viewModel: RMSettingsViewVM
    
    init(viewModel: RMSettingsViewVM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            Text(viewModel.title)
            
        }
    }
}

#Preview {
    RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap({
        return RMSettingsCellVM(type: $0)
    })))
}
