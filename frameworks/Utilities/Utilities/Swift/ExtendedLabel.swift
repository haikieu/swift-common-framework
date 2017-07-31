//
//  ExtendedLabel.swift
//  Utilities
//
//  Created by Kieu, Hai N on 6/8/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit

open class ExtendedLabel : UILabel {
    
    var contentInset : UIEdgeInsets = .zero
    
    open override func drawText(in rect: CGRect) {
        //Add margin for UILabel if it get assigned content inset
        super.drawText(in: UIEdgeInsetsInsetRect(rect, contentInset))
    }
}
