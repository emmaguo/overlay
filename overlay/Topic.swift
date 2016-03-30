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
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    Question(id: 2, type: Question.QuestionType.MultipleChoice, title: "The basic way proximity is applied to design is to...", answers: [
                        Answer(text: "separate related items", isCorrect: false),
                        Answer(text: "use contrasting colors to help content stand out", isCorrect: false),
                        Answer(text: "group related items together", isCorrect: true),
                        Answer(text: "use bold type to create legible text", isCorrect: false)
                    ]),
                    Question(id: 3, type: Question.QuestionType.ProximityDragOne, title: "Organize these items based on the principle of proximity", answers: []),
                    
                    Question(id: 4, type: Question.QuestionType.ProximityTwo, title: "Which business card has better proximity?", answers: []),
                    
                    Question(id: 5, type: Question.QuestionType.MultipleChoice, title: "What does proximity communicate to the viewer?", answers: [
                        Answer(text: "Physical closeness implies a relationship", isCorrect: true),
                        Answer(text: "Design is important", isCorrect: false),
                        Answer(text: "The design is professional", isCorrect: false),
                        Answer(text: "Good consistency in the design", isCorrect: false)
                    ]),
                    Question(id: 6, type: Question.QuestionType.MultipleChoice, title: "Use _______ to define groups of elements", answers: [
                        Answer(text: "serifs", isCorrect: false),
                        Answer(text: "images", isCorrect: false),
                        Answer(text: "space", isCorrect: true),
                        Answer(text: "icons", isCorrect: false)
                    ]),
                    Question(id: 7, type: Question.QuestionType.MultipleChoice, title: "Elements that relate to each other should be grouped...", answers: [
                        Answer(text: "randomly", isCorrect: false),
                        Answer(text: "securely", isCorrect: false),
                        Answer(text: "together", isCorrect: true),
                        Answer(text: "colorfully", isCorrect: false)
                    ]),
                    Question(id: 7, type: Question.QuestionType.MultipleChoice, title: "Empty space in a design is often...", answers: [
                        Answer(text: "bad, because it's an opportunity to communicate something to the user", isCorrect: false),
                        Answer(text: "good, because it helps direct the user towards the content that matters", isCorrect: false),
                        Answer(text: "neutral, because it is not contributing to the actual design", isCorrect: true),
                        Answer(text: "I'm not sure", isCorrect: false)
                    ]),
                    Question(id: 8, type: Question.QuestionType.ProximityThree, title: "How would you apply proximity to sort these words into understandable groups?", answers: []),
                ]),
                Quiz(id: 2, title: "Advanced proximity", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ]),
                Quiz(id: 3, title: "Proximity in digital design", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ])
            ]),
            Topic(name: "Alignment", color: alignmentColor!, quizzes: [
                Quiz(id: 1, title: "Alignment basics", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 2, title: "Advanced alignment", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ]),
                Quiz(id: 3, title: "Alignment in digital design", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ]),
            ]),
            Topic(name: "Repetition", color: repetitionColor!, quizzes: [
                Quiz(id: 1, title: "Repetition basics", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 2, title: "Advanced repetition", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 3, title: "Repetition in digital design", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ]),
            ]),
            Topic(name: "Contrast", color: contrastColor!, quizzes: [
                Quiz(id: 1, title: "Contrast basics", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 2, title: "Advanced contrast", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 3, title: "Contrast in digital design", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ]),
            ]),
            Topic(name: "Color", color: colorColor!, quizzes: [
                Quiz(id: 1, title: "Color wheel 101", questions: [
                    Question(id: 1, type: Question.QuestionType.ColorOne, title: "Select the primary colors", answers: []),
                    Question(id: 2, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 2, title: "Color palette basics", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]),
                    ]),
                Quiz(id: 3, title: "Advanced color palettes", questions: [
                    Question(id: 1, type: Question.QuestionType.MultipleChoice, title: "The purpose of proximity is to...", answers: [
                        Answer(text: "not annoy your neighbor", isCorrect: false),
                        Answer(text: "help organize information", isCorrect: true),
                        Answer(text: "create more formal design", isCorrect: false),
                        Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                    ]),
                ]),
            ])
        ]
    }
}