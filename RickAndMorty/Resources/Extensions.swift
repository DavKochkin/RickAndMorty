//
//  Extensions.swift
//  RickAndMorty
//
//  Created by David Kochkin on 04.04.2024.
//

import UIKit


extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            self.addSubview($0)
        })
    }
}


extension UIView {
    static func configure<T: UIView>(view: T, block: @escaping (T) ->()) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
}


extension UIDevice {
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
}
