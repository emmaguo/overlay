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
    let quizzes: [Quiz]
    
    init(name: String, color: UIColor, quizzes: [Quiz]) {
        self.name = name
        self.color = color
        self.quizzes = quizzes
    }

    static func allTopics() -> [Topic] {
        return [
            Topic(name: "Proximity", color: proximityColor!, quizzes: [
                Quiz(id: 1, title: "Proximity basics", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is...", answers: [
                        Answer(text: "to not annoy your neighbor", isCorrect: false),
                        Answer(text: "helps organize information", isCorrect: true),
                        Answer(text: "create more formal, sedate presentations", isCorrect: false),
                        Answer(text: "helps organize information", isCorrect: false)
                    ]),
                    Question(id: 2, type: Question.QuestionType.MultipleChoice, title: "Question 2", answers: [
                        Answer(text: "answer 1", isCorrect: false),
                        Answer(text: "answer 2", isCorrect: true),
                        Answer(text: "answer 3", isCorrect: false),
                        Answer(text: "answer 4", isCorrect: false)
                    ]),
                    Question(id: 3, type: Question.QuestionType.ProximityDragOne, title: "Group the related items together", answers: []),
                    
                    Question(id: 4, type: Question.QuestionType.ProximityTwo, title: "Which business card has better proximity?", answers: []),
                ])
            ]),
            Topic(name: "Alignment", color: alignmentColor!, quizzes: []),
            Topic(name: "Repetition", color: repetitionColor!, quizzes: []),
            Topic(name: "Contrast", color: contrastColor!, quizzes: []),
            Topic(name: "Color", color: colorColor!, quizzes: [])
        ]
    }
}