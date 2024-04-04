//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by David Kochkin on 04.04.2024.
//

import UIKit

/// Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let image         = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private let nameLabel: UILabel = {
        let label       = UILabel()
        label.textColor = .label
        label.font      = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let statusLabel: UILabel = {
        let label       = UILabel()
        label.textColor = .secondaryLabel
        label.font      = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image  = nil
        nameLabel.text   = nil
        statusLabel.text = nil
    }
    
    
    public func configure(with viewModel: RMCharacterCollectionViewCellVM) {
        
    }
}
