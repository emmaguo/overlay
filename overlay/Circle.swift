//
//  CircleViewExtensions.swift
//  overlay
//
//  Created by Emma Guo on 3/23/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation
import UIKit

func createCircle(center: CGPoint, radius: CGFloat, lineWidth: CGFloat, strokeColor: CGColor, completed: Bool) -> CAShapeLayer {
    
    let shapeLayer = CAShapeLayer()
    let circlePath = UIBezierPath(
        arcCenter: center,
        radius: radius,
        startAngle: CGFloat(0),
        endAngle:CGFloat(M_PI * 2),
        clockwise: true)
    
    shapeLayer.path = circlePath.CGPath
    shapeLayer.strokeColor = strokeColor
    shapeLayer.lineWidth = lineWidth

    if completed == true {
        shapeLayer.fillColor = strokeColor
    } else {
        shapeLayer.fillColor = UIColor.clearColor().CGColor
    }

    return shapeLayer
}