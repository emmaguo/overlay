//
//  Topic.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

class Topic {
    
    let name: String
    let quizzes: [Quiz]
    
    init(name: String, quizzes: [Quiz]) {
        self.name = name
        self.quizzes = quizzes
    }
    
    static func allTopics() -> [Topic] {
        return [
            Topic(name: "Proximity", quizzes: [
                Quiz(id: 1, questions: [
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
                ])
            ])
        ]
    }
    
}