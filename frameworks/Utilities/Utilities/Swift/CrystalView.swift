//
//  CrystalView.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit

open class CrystalView : UIView {
    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        //returning false will make user interaction go to underneith view
        return false
    }
}
