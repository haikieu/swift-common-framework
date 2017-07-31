//
//  GlobalGestureHandler.swift
//  Utilities
//
//  Created by Kieu, Hai N on 7/20/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation
import UIKit

internal class GlobalGestureHandler {
    static let shared = GlobalGestureHandler()
    
    fileprivate init() {}
    
    ///Handle dragging
    @objc func handlePanGesture(_ gesture : PanGestureRecognizer) {
        guard let view = gesture.view, let draggability = view as? Draggable else {
            return
        }
        let focusability = view as? Focusable
        
        let referenceView = UIApplication.shared.keyWindow?.rootViewController?.view
        _ = gesture.velocity(in: referenceView)//get velocity
        let translation = gesture.translation(in: referenceView)
        let newCenter = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        
        switch gesture.state {
        case .began:
            focusability?.focus()
            view.layer.borderColor = borderColor.cgColor
            view.layer.borderWidth = borderWith
            draggability.originPosition = view.center
            draggability.onBeganMoving(from: view.center)
            draggability.onMoving(to: view.center)
            
        case .changed:
            //Move view
            if draggability.shouldMove(to: newCenter, current: .changed) {
                view.center = newCenter
                gesture.setTranslation(.zero, in: referenceView)
                draggability.onMoving(to: newCenter)
            }
            
        case .ended:
            if draggability.shouldMove(to: view.center, current: .ended) {
                draggability.onEndedMoving(from: draggability.originPosition!, to: view.center)
            } else {
                if draggability.shouldRevertOnFailure(from: view.center, to: draggability.originPosition!, current: .ended) {
                    draggability.onReverting(from: view.center, to: draggability.originPosition!, current: .ended)
                }
            }
            view.layer.borderColor = UIColor.clear.cgColor
            view.layer.borderWidth = 0
            draggability.originPosition = nil
            focusability?.unfocus()
            
        case .failed, .cancelled:
            
            if draggability.shouldRevertOnFailure(from: view.center, to: draggability.originPosition!, current: gesture.state) {
                draggability.onReverting(from: view.center, to: draggability.originPosition!, current: gesture.state)
            }
            
            view.layer.borderColor = UIColor.clear.cgColor
            view.layer.borderWidth = 0
            draggability.originPosition = nil
            focusability?.unfocus()
            break
        default:
            
            break
        }
    }
    
    
    
}
