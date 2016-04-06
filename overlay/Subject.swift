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
    let duration: Int
    let lessons: [LessonCard]
    let quizzes: [Question]
    
    init(name: String, duration: Int = 2, lessons: [LessonCard], quizzes: [Question]) {
        self.name = name
        self.duration = duration
        self.lessons = lessons
        self.quizzes = quizzes
    }
}