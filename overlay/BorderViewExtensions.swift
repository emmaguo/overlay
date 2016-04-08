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
        addBorder(outlineInactive.CGColor, lineWidth: 1, lineDashPattern: [8,16], singleUse: false)
    }
    
    func addActiveDashedBorder() {
        addBorder(outlineActive.CGColor, lineWidth: 1.4, lineDashPattern: [8,16], singleUse: false)
    }
    
    func addSelectedBorder() {
        addBorder(outlineActive.CGColor, lineWidth: 1.4, lineDashPattern: [20,0], singleUse: false)
    }
    
    func addDefaultBorderInactive() {
        addBorder(outlineInactive.CGColor, lineWidth: 1, lineDashPattern: [20,0], singleUse: false)
    }
    
    func addDefaultBorderActive(borderColor: CGColor = proximityColor.CGColor) {
        addBorder(borderColor, lineWidth: 4, lineDashPattern: [20,0], singleUse: false)
    }
    
    func addBorder(strokeColor: CGColor, lineWidth: CGFloat, lineDashPattern: [Int], singleUse: Bool) {
        
        if !singleUse {
            self.layer.sublayers?.forEach({ (layer) -> () in
                layer.removeFromSuperlayer()
            })
        }

        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = lightestGray.CGColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = lineDashPattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).CGPath
        shapeLayer.cornerRadius = 6
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addColorBorder() {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = mediumGray.CGColor
        shapeLayer.lineWidth = 4
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 30).CGPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func removeColorBorder() {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 5
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 30).CGPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addCircleBorder() {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 4
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 60).CGPath
        
        self.layer.addSublayer(shapeLayer)
    }
}