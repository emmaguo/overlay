//
//  Data.swift
//  overlay
//
//  Created by Emma Guo on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation

let OverlayData = [
    Topic(
        name: "Proximity",
        color: proximityColor!,
        description: "Organize information, reduce clutter",
        subjects: [
            Subject(
                name: "Proximity basics",
                duration: 5,
                lessons: [
                    LessonCard(title: "Title one", image: nil, body: "This is body one"),
                    LessonCard(title: "Title two", image: nil, body: "Body two"),
                    LessonCard(title: "Title three", image: nil, body: "Body three")
                ],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "The purpose of proximity is to...",
                        answers: [
                            Answer(text: "show contrast", isCorrect: false),
                            Answer(text: "help organize information", isCorrect: true),
                            Answer(text: "create more formal design", isCorrect: false),
                            Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "The basic way proximity is applied to design is to...",
                        answers: [
                            Answer(text: "separate related items", isCorrect: false),
                            Answer(text: "use contrasting colors to help content stand out", isCorrect: false),
                            Answer(text: "group related items together", isCorrect: true),
                            Answer(text: "use bold type to create legible text", isCorrect: false)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.ProximityDragOne,
                        title: "Organize these items based on the principle of proximity",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.ProximityTwo,
                        title: "Which business card has better proximity?",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "What does proximity communicate to the viewer?",
                        answers: [
                            Answer(text: "Physical closeness implies a relationship", isCorrect: true),
                            Answer(text: "Design is important", isCorrect: false),
                            Answer(text: "The design is professional", isCorrect: false),
                            Answer(text: "Good consistency in the design", isCorrect: false)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "Use _______ to define groups of elements",
                        answers: [
                            Answer(text: "serifs", isCorrect: false),
                            Answer(text: "images", isCorrect: false),
                            Answer(text: "space", isCorrect: true),
                            Answer(text: "icons", isCorrect: false)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "Elements that relate to each other should be grouped...",
                        answers: [
                            Answer(text: "randomly", isCorrect: false),
                            Answer(text: "securely", isCorrect: false),
                            Answer(text: "together", isCorrect: true),
                            Answer(text: "colorfully", isCorrect: false)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "Empty space in a design is often...",
                        answers: [
                            Answer(text: "bad, because it's an opportunity to communicate something to the user", isCorrect: false),
                            Answer(text: "good, because it helps direct the user towards the content that matters", isCorrect: false),
                            Answer(text: "neutral, because it is not contributing to the actual design", isCorrect: true),
                            Answer(text: "I'm not sure", isCorrect: false)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.ProximityThree,
                        title: "Use proximity to sort these words into understandable groups",
                        answers: []
                    )
                ]
            ),
            Subject(
                name: "Advanced proximity",
                duration: 4,
                lessons: [],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "The purpose of proximity is to...",
                        answers: [
                            Answer(text: "not annoy your neighbor", isCorrect: false),
                            Answer(text: "help organize information", isCorrect: true),
                            Answer(text: "create more formal design", isCorrect: false),
                            Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]
                    )
                ]
            ),
            Subject(
                name: "Proximity in digital design",
                duration: 2,
                lessons: [],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "The purpose of proximity is to...",
                        answers: [
                            Answer(text: "not annoy your neighbor", isCorrect: false),
                            Answer(text: "help organize information", isCorrect: true),
                            Answer(text: "create more formal design", isCorrect: false),
                            Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]
                    )
                ]
            )
        ]
    ),
    Topic(
        name: "Alignment",
        color: alignmentColor!,
        description: "Organize information, reduce clutter",
        subjects: [
            Subject(
                name: "Alignment basics",
                lessons: [],
                quizzes: []
            ),
            Subject(
                name: "Advanced alignment",
                lessons: [],
                quizzes: []
            ),
            Subject(
                name: "Alignment in digital design",
                lessons: [],
                quizzes: []
            ),
        ]
    ),
    Topic(
        name: "Repetition",
        color: repetitionColor!,
        description: "Organize information, reduce clutter",
        subjects: [
            Subject(
                name: "Repetition basics",
                lessons: [],
                quizzes: []
            ),
            Subject(
                name: "Advanced repetition",
                lessons: [],
                quizzes: []
            ),
            Subject(
                name: "Repetition in digital design",
                lessons: [],
                quizzes: []
            ),
        ]
    ),
    Topic(
        name: "Contrast",
        color: contrastColor!,
        description: "Organize information, reduce clutter",
        subjects: [
            Subject(
                name: "Contrast basics",
                lessons: [],
                quizzes: []
            ),
            Subject(
                name: "Advanced contrast",
                lessons: [],
                quizzes: []
            ),
            Subject(
                name: "Contrast in digital design",
                lessons: [],
                quizzes: []
            ),
        ]
    ),
    Topic(
        name: "Color",
        color: colorColor!,
        description: "Organize information, reduce clutter",
        subjects: [
            Subject(
                name: "Color wheel 101",
                lessons: [],
                quizzes: [
                    Question(
                        type: Question.QuestionType.ColorOne,
                        title: "Select the primary colors",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.ColorTwo,
                        title: "Select the secondary colors",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "What is hue?",
                        answers: [
                            Answer(text: "The lightness or darkness of a color", isCorrect: false),
                            Answer(text: "The overall intensity or brightness of a color", isCorrect: false),
                            Answer(text: "The addition of gray to a pure color", isCorrect: false),
                            Answer(text: "The perceived value of a color, or the color itself", isCorrect: true)
                        ]
                    ),
                    Question(
                        type: Question.QuestionType.ColorThree,
                        title: "Select red and two analogous colors",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.ColorFour,
                        title: "What do you add to the blue square to give it shade?",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.ColorFive,
                        title: "What do you add to the green square to give it tint?",
                        answers: []
                    ),
                    Question(
                        type: Question.QuestionType.ColorSix,
                        title: "Select three colors with a triad relationship",
                        answers: []
                    )
                ]
            ),
            Subject(
                name: "Color palette basics",
                lessons: [],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "The purpose of proximity is to...",
                        answers: [
                            Answer(text: "not annoy your neighbor", isCorrect: false),
                            Answer(text: "help organize information", isCorrect: true),
                            Answer(text: "create more formal design", isCorrect: false),
                            Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]
                    )
                ]
            ),
            Subject(
                name: "Advanced color palettes",
                lessons: [],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "The purpose of proximity is to...",
                        answers: [
                            Answer(text: "not annoy your neighbor", isCorrect: false),
                            Answer(text: "help organize information", isCorrect: true),
                            Answer(text: "create more formal design", isCorrect: false),
                            Answer(text: "highlight your knowledge of design principles", isCorrect: false)
                        ]
                    )
                ]
            ),
        ]
    )
]