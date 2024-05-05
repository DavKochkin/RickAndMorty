//
//  RMLocationDetailViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 05.05.2024.
//

import UIKit

class RMLocationDetailViewController: UIViewController {
    private let location: RMLocation

    //MARK: - Init
    
    init(location: RMLocation) {
        self.location = location
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Location"
        
        view.backgroundColor = .systemBackground
    }
}
