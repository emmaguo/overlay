//
//  SubjectCell.swift
//  overlay
//
//  Created by Emma Guo on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var subjectContentView: UIView!
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var innerCircle: UIView!
    
    var status: Bool! {
        didSet {
            if status == true {
                innerCircle.backgroundColor = UIColor(white: 1, alpha: 0)
            }
        }
    }
    
    var mainColor: UIColor! {
        didSet {
            circle.backgroundColor = mainColor
            bottomLine.backgroundColor = mainColor
            topLine.backgroundColor = mainColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        circle.layer.cornerRadius = circle.frame.size.height / 2
        innerCircle.layer.cornerRadius = innerCircle.frame.size.height / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}