//
//  Lesson.swift
//  overlay
//
//  Created by Michelle Harvey on 4/3/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class Lesson {
    
    let id: Int
    let quizId: Int
    let lessonCards: [LessonCard]

    init(id: Int, quizId: Int, lessonCards: [LessonCard]) {
        self.id = id
        self.quizId = quizId
        self.lessonCards = lessonCards
    }
    
    static func allLessons() -> [Lesson] {
        return [
            Lesson(id: 1, quizId: 1, lessonCards: [
                LessonCard(
                    id: 1,
                    title: "Title 1",
                    image: nil,
                    body: "This is all the body text for card 1"
                ), LessonCard(
                    id: 2,
                    title: "Title 2",
                    image: nil,
                    body: "Body for card 2"
                ), LessonCard(
                    id: 3,
                    title: "Title 3",
                    image: nil,
                    body: "Body for card 3"
                )
            ])
        ]
    }
    
}
