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
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.red)
                        .padding(8)
                        .background(Color(viewModel.iconContainerColor))
                        .presentationCornerRadius(6)
                }
                Text(viewModel.title)
                    .padding(.leading, 10)
            }
            .padding(.bottom, 3)
        }
    }
}

#Preview {
    RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap({
        return RMSettingsCellVM(type: $0)
    })))
}
