//
//  Utils.swift
//  PracticalTestAmitDhadse
//
//  Created by Amit Dhadse on 11/08/20.
//  Copyright © 2020 Amit Dhadse. All rights reserved.
//

import Foundation
import UIKit

final class Utils {

static let sharedInstance = Utils()
    private init() {}
    
    func getAttributtedText(aTextOne: String, aTextTwo: String, aColor: UIColor) -> NSMutableAttributedString {
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : aColor]

        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : aColor]

        let attributedString1 = NSMutableAttributedString(string: aTextOne, attributes:attrs1)

        let attributedString2 = NSMutableAttributedString(string: aTextTwo, attributes:attrs2)

        attributedString1.append(attributedString2)
        
        return attributedString1
    
        
        
    }
}
