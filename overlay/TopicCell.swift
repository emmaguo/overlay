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

    override func awakeFromNib() {
        super.awakeFromNib()

//        let center = circleView.center
//        let radius = CGFloat(circleView.frame.height / 2)
//        let shapeLayer = createCircle(center, radius: radius)
//        circleView.layer.addSublayer(shapeLayer)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
