//
//  UIViewController+Extensions.swift
//  Utilities
//
//  Created by Kieu, Hai N on 4/10/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    //MARK:- Alert methods
    public func alert(withTitle title: String, message: String? = nil, completion: (()->Void)? = nil ) {
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Cancel", style: .default) { (UIAlertAction) in
            //Dummy  clossure, temporarily do nothing
        }
        alertVC.addAction(action)
        self.present(alertVC, animated: true) { 
            //Do anything after presetion
            if let completion = completion {
                completion()
            }
        }
        
    }
    
    //MARK:- Present utilities
    //This tell us if the vc is presented by any view controller
    public var isPresented : Bool {
        return self.presentingViewController != nil
    }
    
    ///This tell us if the vc is presenting any view controller
    public var isPresenting : Bool {
        return self.presentedViewController != nil
    }

    //This tell us if the vc is presented as well as presenting any view controller
    public var isPresentedAndPresenting : Bool {
        return isPresented && isPresenting
    }
    
    public var currentPresentLevel : Int {
        if let presentingViewController = self.presentingViewController {
            return 1 + presentingViewController.currentPresentLevel
        } else {
            return 0
        }
    }
    
    public var totalPresentLevel : Int {
        return currentPresentLevel + abovePresentLevel
    }
    
    fileprivate var abovePresentLevel : Int {
        if let presentedViewController = self.presentedViewController {
            return 1 + presentedViewController.abovePresentLevel
        } else {
            return 0
        }
    }
}
