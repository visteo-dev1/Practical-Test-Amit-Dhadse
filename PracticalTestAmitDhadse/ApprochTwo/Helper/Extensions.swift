//
//  Extensions.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fixInView(_ container: UIView!) {
        translatesAutoresizingMaskIntoConstraints = false
        frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }

    func setShadowBorder() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor

        layer.shadowOffset = CGSize.zero

        layer.shadowRadius = 1.0

        layer.shadowOpacity = 0.4
    }
}
