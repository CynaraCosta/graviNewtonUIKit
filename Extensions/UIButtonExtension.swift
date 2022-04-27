//
//  UIButtonExtension.swift
//  GraviNewton
//
//  Created by Cynara Costa on 31/03/22.
//

import Foundation
import UIKit

extension UIButton{
    
    func dropp(timeToFall: Float){
        let dropp = CABasicAnimation(keyPath: "position")
        dropp.duration = Double(timeToFall)
        dropp.fillMode = .forwards
        dropp.beginTime = CACurrentMediaTime()
        dropp.isRemovedOnCompletion = true
        
        let fromPoint = CGPoint(x: center.x, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x, y: center.y + 152)
        let toValue = NSValue(cgPoint: toPoint)
        
        dropp.fromValue = fromValue
        dropp.toValue = toValue
        
        layer.add(dropp, forKey: nil)
    }
    
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.3
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 2.5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 2.5, y: center.y )
        let toValue = NSValue(cgPoint: toPoint)

        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
}
