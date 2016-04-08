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
    
    var topicIndex: Int! {
        didSet{
            // Remove any existing circle
            circleView.layer.sublayers?.forEach({ layer in
                layer.removeFromSuperlayer()
            })
            
            // Add circle
            let center = CGPoint(x: 50, y: 60)
            let radius = CGFloat(25)
            let lineWidth = CGFloat(3)
            let strokeColor = OverlayData[topicIndex].color.CGColor
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let topicStatus = userDefaults.valueForKey("Topic-" + String(topicIndex))
            let completed = (topicStatus as? Bool) ?? false
            
            let shapeLayer = createCircle(
                center,
                radius: radius,
                lineWidth: lineWidth,
                strokeColor: strokeColor,
                completed: completed)

            circleView.layer.addSublayer(shapeLayer)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = topicCellBorderColor.CGColor
        topicNameLabel.font = headerFontOne
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
