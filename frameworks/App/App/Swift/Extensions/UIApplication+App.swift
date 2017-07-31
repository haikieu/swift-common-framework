//
//  UIApplication+Core.swift
//  Core
//
//  Created by Kieu, Hai N on 4/8/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public extension UIApplication {
    var appDelegate : BaseAppDelegate {
        return self.delegate as! BaseAppDelegate
    }
    
    var appSetting : BaseAppSetting {
        return self.appDelegate.appSetting
    }
    
    var userProfile : BaseUserProfile {
        return self.appDelegate.userProfile
    }
}
