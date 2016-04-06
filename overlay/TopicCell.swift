//
//  TopicCell.swift
//  overlay
//
//  Created by Emma Guo on 3/13/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {

    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var circleFillView: UIView!
    
    var mainColor: UIColor! {
        didSet {
            
            // Remove any existing circle
            circleView.layer.sublayers?.forEach({ (layer) -> () in
                layer.removeFromSuperlayer()
            })
            
            // Add circle
//            let center = CGPoint(x: 50, y: 60)
            let radius = CGFloat(25)
            let lineWidth = CGFloat(3)
            let strokeColor = mainColor.CGColor
            
            let shapeLayer = createCircle(
                CGPoint(x:50, y: 60),
                radius: radius,
                lineWidth: lineWidth,
                strokeColor: strokeColor,
                fillColor: UIColor.clearColor().CGColor,
                strokeEnd: 1.0,
                startAngle: 0


            )
            
            let shapeFillLayer = createCircle(
                CGPoint(x:50, y: 60),
                radius: radius,
                lineWidth: lineWidth,
                strokeColor: strokeColor,
                fillColor: mainColor.CGColor,
                strokeEnd: 1.0,
                startAngle: 4
            )
            
            circleView.layer.addSublayer(shapeLayer)
            circleView.layer.addSublayer(shapeFillLayer)
            
        }
        
    
        
        
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = topicCellBorderColor!.CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
