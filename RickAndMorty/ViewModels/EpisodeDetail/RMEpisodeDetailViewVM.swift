//
//  RMEpisodeDetailViewVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 16.04.2024.
//

import UIKit

protocol RMEpisodeDetailViewVMDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewVM {
    private let endpointUrl: URL?
    private var dataTuple: (episode: RMEpisode, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum SectionType {
        case information(viewModel: [RMEpisodeInfoCollectionViewCellVM])
        case characters(viewModel:  [RMCharacterCollectionViewCellVM])
    }
    
    public weak var delegate: RMEpisodeDetailViewVMDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []

    
    //MARK: - Init
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }

    //MARK: - Private
    
    private func createCellViewModels() {
        guard let dataTuple = dataTuple else { return }
        
        let episode    = dataTuple.episode
        let characters = dataTuple.characters
        cellViewModels = [
            .information(viewModel: [
                .init(title: "Episode Name", value: episode.name),
                .init(title: "Air Date",     value: episode.air_date),
                .init(title: "Episode",      value: episode.episode),
                .init(title: "Created",      value: episode.created),
            ]),
            .characters(
                viewModel: characters.compactMap({ character in
                    return RMCharacterCollectionViewCellVM(
                        characterName: character.name,
                        characterStatus: character.status,
                        characterImageUrl: URL(string: character.image)
                    )
                })
            )
        ]
    }
    
    /// Fetch backing episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case . failure(_):
                break
            }
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })
        
        // 10 of parallel requests
        // Notified once all done
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request,
                                     expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
            }
        }
        group.notify(queue: .main) {
            self.dataTuple = (
                episode: episode,
                characters: characters
            )
        }
    }
}
