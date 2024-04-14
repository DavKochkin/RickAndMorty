//
//  RMCharacterPhotoCollectionViewCellVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 14.04.2024.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellVM {
    private let imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void ) {
        guard let imageUrl = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl, completion: completion)
    }
}
