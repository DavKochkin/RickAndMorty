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
