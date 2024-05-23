//
//  RMSearchResultVM.swift
//  RickAndMorty
//
//  Created by David Kochkin on 19.05.2024.
//

import Foundation

protocol RMSearchResultRepresentable {
    associatedtype ResultType
    
    var results: [ResultType] { get }
}

struct RMSearchResultVM<T>: RMSearchResultRepresentable {
    typealias ResultType = T
    var results: [ResultType]
}
