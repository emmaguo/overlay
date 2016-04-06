//
//  CircleViewExtensions.swift
//  overlay
//
//  Created by Emma Guo on 3/23/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation
import UIKit

func createCircle(center: CGPoint, radius: CGFloat, lineWidth: CGFloat, strokeColor: CGColor, fillColor: CGColor, strokeEnd: CGFloat, startAngle: CGFloat) -> CAShapeLayer {
    
    let shapeLayer = CAShapeLayer()
    let circlePath = UIBezierPath(
        arcCenter: center,
        radius: radius,
        startAngle: startAngle,
        endAngle:CGFloat(M_PI * 2),
        clockwise: true)
    
    shapeLayer.path = circlePath.CGPath
    shapeLayer.strokeColor = strokeColor
    shapeLayer.fillColor = fillColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.strokeEnd = strokeEnd
    
    return shapeLayer
}