//
//  Topic.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class Topic {
    
    let name: String
    let color: UIColor
    let subjects: [Subject]
    
    init(name: String, color: UIColor, subjects: [Subject]) {
        self.name = name
        self.color = color
        self.subjects = subjects
    }
}