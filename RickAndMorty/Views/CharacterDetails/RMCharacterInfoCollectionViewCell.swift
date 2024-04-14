//
//  RMCharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by David Kochkin on 14.04.2024.
//

import UIKit

final class RMCharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    public func configure(with viewModel: RMCharacterInfoCollectionViewCellVM) {
        
    }
}
