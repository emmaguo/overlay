//
//  Subject.swift
//  overlay
//
//  Created by Emma Guo on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation

class Subject {
    
    let name: String
    let lessons: [LessonCard]
    let quizzes: [Question]
    
    init(name: String, lessons: [LessonCard], quizzes: [Question]) {
        self.name = name
        self.lessons = lessons
        self.quizzes = quizzes
    }
}