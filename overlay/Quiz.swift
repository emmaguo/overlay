//
//  Quiz.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//


class Quiz {
    
    let id: Int
    let questions: [Question]
    
    init(id: Int, questions: [Question]) {
        self.id = id
        self.questions = questions
    }

}
