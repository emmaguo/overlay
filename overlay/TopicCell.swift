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
    var mainColor: UIColor! {
        didSet {
            // Remove any existing circle
            circleView.layer.sublayers?.forEach({ (layer) -> () in
                layer.removeFromSuperlayer()
            })
            
            // Add circle
            let center = circleView.center
            let radius = CGFloat(25)
            let lineWidth = CGFloat(2)
            let strokeColor = mainColor.CGColor
            
            let shapeLayer = createCircle(
                center,
                radius: radius,
                lineWidth: lineWidth,
                strokeColor: strokeColor)
            
            circleView.layer.addSublayer(shapeLayer)
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
