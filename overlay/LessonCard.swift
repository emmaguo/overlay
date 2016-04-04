//
//  LessonCard.swift
//  overlay
//
//  Created by Michelle Harvey on 4/3/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class LessonCard {
    
    let id: Int
    let title: String
    let image: UIImage?
    let body: String
    
    init(id: Int, title: String, image: UIImage?, body: String) {
        self.id = id
        self.title = title
        self.image = image
        self.body = body
    }
    
}