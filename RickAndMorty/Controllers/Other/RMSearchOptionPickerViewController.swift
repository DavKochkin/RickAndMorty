//
//  RMSearchOptionPickerViewController.swift
//  RickAndMorty
//
//  Created by David Kochkin on 13.05.2024.
//

import UIKit

final class RMSearchOptionPickerViewController: UIViewController {
    private let option: RMSearchInputViewVM.DynamicOption
    
    // MARK: - Init
    
    init(option: RMSearchInputViewVM.DynamicOption) {
        self.option = option
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
