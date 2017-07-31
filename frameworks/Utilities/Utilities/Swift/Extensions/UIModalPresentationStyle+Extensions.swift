//
//  UIModalPresentationStyle+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/10/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public extension UIModalPresentationStyle {
    public var stringValue : String {
        switch self {
        case .fullScreen:
            return "fullScreen"
        case .pageSheet:
            return "pageSheet"
        case .formSheet:
            return "formSheet"
        case .currentContext:
            return "currentContext"
        case .custom:
            return "custom"
        case .overFullScreen:
            return "overFullScreen"
        case .overCurrentContext:
            return "overCurrentContext"
        case .none:
            fallthrough
        default:
            return "none"
        }
    }
}
