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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
