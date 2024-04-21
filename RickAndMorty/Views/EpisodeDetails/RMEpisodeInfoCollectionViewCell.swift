//
//  RMEpisodeInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by David Kochkin on 19.04.2024.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "RMEpisodeInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellVM) {
        
    }
}
