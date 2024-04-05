//
//  CharacterListViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 04.04.2024.
//

import UIKit

protocol RMCharacterListViewVMDelegate: AnyObject {
    func didLoadInitialCharactes()
    func didSelectCharacter(_ character: RMCharacterListView)
}

final class RMCharacterListViewVM: NSObject {
    
    public weak var delegate: RMCharacterListViewVMDelegate?
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellVM(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellVM] = []
    
    public func fetchCharacters() {
        RMService.shared.execute(
            .listCharactersRequest,
            expecting: RMGetCharacterResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results      = responseModel.results
                self?.characters = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharactes() 
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


extension RMCharacterListViewVM: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.width - 30) / 2
            return CGSize(width: width, height: width * 1.5)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
}
