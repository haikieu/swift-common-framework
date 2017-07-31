//
//  UIDevice+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/16/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public extension UIDevice {
    
    #if os(iOS)
    public var isPhone : Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public var isPad : Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    #endif
    
    #if os(tvOS)
    public var isTV : Bool {
        if #available(iOS 9.0, *) {
            return UIDevice.current.userInterfaceIdiom == .tv
        } else {
            // Fallback on earlier versions
            return false
        }
    }
    #endif
}

#if os(iOS)
public extension UIInterfaceOrientationMask {
    
    public var isPortrait : Bool {
        return self == .portrait
    }
    
    public var isLandScape : Bool {
        return self == .landscape || self == .landscapeLeft || self == .landscapeRight
    }
    
    public var interfaceOrientationValue : UIInterfaceOrientation {
        if self == .portrait {
            return .portrait
        } else if self == .landscapeRight {
            return .landscapeRight
        } else if self == .landscapeLeft {
            return .landscapeLeft
        } else if self == .portraitUpsideDown {
            return .portraitUpsideDown
        } else {
            return .unknown
        }
    }
}

public extension UIInterfaceOrientation {
    
}
#endif
