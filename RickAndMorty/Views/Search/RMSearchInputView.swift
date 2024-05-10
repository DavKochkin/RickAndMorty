//
//  RMSearchInputView.swift
//  RickAndMorty
//
//  Created by David Kochkin on 07.05.2024.
//

import UIKit

final class RMSearchInputView: UIView {
    
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Search"
        return search
    }()
    
    private var viewModel: RMSearchInputViewVM? {
        didSet {
            guard let viewModel = viewModel, viewModel.hasDynamicOptions else {
                return
            }
            let options = viewModel.options
            createOptionSelectionView(options: options)
        }
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(searchBar)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 58),
        ])
    }
    
    private func createOptionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis         = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment    = .center
        stackView.spacing      = 6
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        return stackView
    }
    
    private func createOptionSelectionView(options: [RMSearchInputViewVM.DynamicOption]) {
        let stackView = createOptionStackView()
        
        for x in 0..<options.count {
            let option = options[x]
            let button = UIButton()
            button.setAttributedTitle(
                NSAttributedString(
                    string: option.rawValue,
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                        .foregroundColor: UIColor.label
                    ]),
                for: .normal
            )
            button.backgroundColor = .secondarySystemBackground
            button.setTitleColor(.label, for: .normal)
            button.addTarget(self, action: #selector(didTapbutton(_:)), for: .touchUpInside)
            button.tag = x
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc
    private func didTapbutton(_ sender: UIButton) {
        guard let options = viewModel?.options else {
            return
        }
        let tag = sender.tag
        let selected = options[tag]
        
        print("Did tap \(selected.rawValue)")
    }
    
    
    //MARK: - Public
    
    public func configure(with viewModel: RMSearchInputViewVM) {
        searchBar.placeholder = viewModel.searchPlaceholderText
        self.viewModel = viewModel
    }
    
    public func presentKeyboard() {
        searchBar.becomeFirstResponder()
    }
}
