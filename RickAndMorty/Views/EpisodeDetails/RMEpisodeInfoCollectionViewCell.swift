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
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpLayer() {
        layer.cornerRadius  = 8
        layer.masksToBounds = true
        layer.borderWidth   = 1
        layer.borderColor   = UIColor.secondaryLabel.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellVM) {
        
    }
}
