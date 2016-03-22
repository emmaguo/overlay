//
//  CircleViewExtensions.swift
//  overlay
//
//  Created by Emma Guo on 3/21/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation
import UIKit

func createCircle(center: CGPoint, radius: CGFloat) -> CAShapeLayer {
    
    let shapeLayer = CAShapeLayer()
    let circlePath = UIBezierPath(
        arcCenter: center,
        radius: radius,
        startAngle: CGFloat(0),
        endAngle:CGFloat(M_PI * 2),
        clockwise: true)
    
    shapeLayer.path = circlePath.CGPath
    
    //change the fill color
    shapeLayer.fillColor = UIColor.clearColor().CGColor
    //Change the stroke color
    shapeLayer.strokeColor = UIColor.redColor().CGColor
    //you can change the line width
    shapeLayer.lineWidth = 3.0
    
    return shapeLayer
}