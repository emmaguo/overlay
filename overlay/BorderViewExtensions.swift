//
//  BorderViewExtensions.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addInactiveDashedBorder() {
        addBorder(outlineInactive!.CGColor, lineDashPattern: [8,16])
    }
    
    func addActiveDashedBorder() {
        addBorder(outlineActive!.CGColor, lineDashPattern: [8,16])
    }
    
    func addSelectedBorder() {
        addBorder(outlineActive!.CGColor, lineDashPattern: [20,0])
    }
    
    func addBorder(strokeColor: CGColor, lineDashPattern: [Int]) {
        self.layer.sublayers?.forEach({ (layer) -> () in
            layer.removeFromSuperlayer()
        })
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = lightestGray?.CGColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).CGPath
        
        self.layer.addSublayer(shapeLayer)
    }
}