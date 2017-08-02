//
//  Dockable.swift
//  Utilities
//
//  Created by Kieu, Hai N on 7/20/17.
//  Copyright © 2017 Hai Kieu. All rights reserved.
//

import Foundation

public protocol Dockable : Draggable {
    
    var topOffset : CGFloat {get set}
    var bottomOffset : CGFloat {get set}
    var margin : CGFloat {get set}
    var lastDockedPosition : BindingType<DockedPosition> {get set}
    
    func moveToLastCornerPos(animated: Bool)
    func move(toCorner corner:DockedPosition, animated : Bool)
    func move(toHidingCorner corner:DockedPosition, animated : Bool)
}

public extension Dockable where Self : UIView {
    
    func onEndedMoving(from originPosition: CGPoint, to lastPosition: CGPoint) {
        lastDockedPosition.value = calculateCorner(byPosition: lastPosition)
        move(toCorner: lastDockedPosition.value!, animated: true)
    }
    
    //MARK: - calculate stuffs
    
    func moveToLastCornerPos(animated: Bool = true) {
        move(toCorner: lastDockedPosition.value!,animated : animated)
    }
    
    /// The method which helps move this view to a certain corner
    func move(toCorner corner:DockedPosition, animated : Bool = true) {
        //Update last position
        lastDockedPosition.value = corner
        
        let point = calculatePosition(byDockedPosition: corner)
        let rect = CGRect.init(origin: point, size: bounds.size)
        UIView.animate(withDuration: animated ? duration : 0, delay: delay, options: .curveEaseIn, animations: {
            self.frame = rect
        }) { (Bool) in
            
        }
    }
    
    /// The method which helps hide this view by moving it to a specific corner
    func move(toHidingCorner corner:DockedPosition, animated : Bool = true) {
        //Update last position
        lastDockedPosition.value = corner
        
        let point = calculateHidingPosition(byDockedPosition: corner)
        let rect = CGRect.init(origin: point, size: bounds.size)
        
        UIView.animate(withDuration: animated ? duration : 0, delay: delay, options: .curveEaseIn, animations: {
            self.frame = rect
        }) { (Bool) in
            self.frame = rect
        }
    }
    
    /// The method that helps calculate the position by corner
    private func calculateCorner(byPosition position:CGPoint) -> DockedPosition {
        
        let centerX = UIScreen.main.bounds.midX
        let centerY = UIScreen.main.bounds.midY
        var corner = DockedPosition.unknown
        
        if position.x < centerX {
            if position.y < centerY {
                
                //Move to top-left corner
                corner = .topLeft
            } else {
                
                //Move to bottom-left corner
                corner = .bottomLeft
            }
        } else {
            if position.y < centerY {
                
                //Move to top-right corner
                corner = .topRight
            } else {
                
                //Move to bottom-right corner
                corner = .bottomRight
            }
        }
        return corner
    }
    
    private func calculatePosition(byDockedPosition DockedPosition: DockedPosition) -> CGPoint {
        
        var x = -1 as CGFloat
        var y = -1 as CGFloat
        
        switch DockedPosition {
        case .topLeft:
            x = margin
            y = margin + topOffset
            break
        case .topRight:
            x = screenSize.width - width - margin
            y = margin + topOffset
            break
        case .bottomLeft:
            x = margin
            y = screenSize.height - height - margin - bottomOffset
            break
        case .bottomRight:
            x = screenSize.width - width - margin
            y = screenSize.height - height - margin - bottomOffset
            break
        default:
            break
        }
        
        return CGPoint.init(x: x, y: y)
    }
    
    private func calculateHidingPosition(byDockedPosition DockedPosition: DockedPosition) -> CGPoint {
        
        var x = -1 as CGFloat
        var y = -1 as CGFloat
        
        switch DockedPosition {
        case .topLeft:
            x = -width - margin
            y = margin + topOffset
            break
        case .topRight:
            x = screenSize.width + width + margin
            y = margin + topOffset
            break
        case .bottomLeft:
            x = -width - margin
            y = screenSize.height - height - margin - bottomOffset
            break
        case .bottomRight:
            x = screenSize.width + width + margin
            y = screenSize.height - height - margin - bottomOffset
            break
        default:
            break
        }
        
        return CGPoint.init(x: x, y: y)
    }

}
