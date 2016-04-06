//
//  Data.swift
//  overlay
//
//  Created by Emma Guo on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import Foundation
import UIKit

let correctImage = UIImage(named: "button_correct") as UIImage?


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
                    LessonCard(title: "What is proximity?", image: nil, body: "At a basic level, proximity is the nearness of something in place, order, or relation to something else. Proximity is a basic principle of design that is used to group related items together because physical closeness implies a relationship."),
                    LessonCard(title: "Why use proximity?", image: nil, body: "Proximity helps us organize information. Organized information reduces clutter and gives your audience a clear structure that will help them understand how to begin reading the message. If something isn’t well organized, it’s less likely to be read and remembered."),
                    LessonCard(title: "Organizing blocks", image: nil, body: "Grouped items also make it easier to find information because they become one visual unit rather than several. A trick to help you check this idea is to squint your eyes slightly and count the number of visual elements on the page by counting how many times your eye stops."),
                    LessonCard(title: "Example of proximity", image: UIImage(named: "list_noproximity") as UIImage?, body: "Take a quick look at this list of desserts and notice what you assume about the list."),
                    LessonCard(title: "Example of proximity", image: UIImage(named: "list_proximity") as UIImage?, body: "Now take a look again. Does it seem like the last few desserts are different from the rest?")
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
                            Answer(text: "good, because it helps direct the user towards the content that matters", isCorrect: true),
                            Answer(text: "neutral, because it is not contributing to the actual design", isCorrect: false),
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
                lessons: [
                    LessonCard(title: "What is the big deal?", image: nil, body: "We’ve already talked about how proximity helps us organize information, but even if something is organized, you may want to emphasize or downplay a specific element."),
                    LessonCard(title: "Ch-ch-changes", image: nil, body: "When grouping items into close proximity, you usually need to make changes. These changes can come from adjusting the size or font weight or placement of text and graphics."),
                    LessonCard(title: "Near. Far. Wherever you are.", image: nil, body: "Proximity doesn’t mean everything is close together. All elements on the page have some sort of relationship to each other based on how close or far away they are.")
                ],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "What can you use to emphasize an element",
                        answers: [
                            Answer(text: "Size", isCorrect: false),
                            Answer(text: "Shape", isCorrect: false),
                            Answer(text: "Color", isCorrect: false),
                            Answer(text: "All of the above", isCorrect: true)
                        ]
                    )
                ]
            ),
            Subject(
                name: "Proximity in digital design",
                duration: 2,
                lessons: [
                    LessonCard(title: "What to avoid", image: nil, body: "It might seem easy to design something that is organized and easy to read, but lets look at some common mistakes when designing something. Avoid having too many separate elements on a page. After 3-5 items, see which elements can be grouped together."),
                    LessonCard(title: "White space", image: nil, body: "Avoid leaving equal amounts of white space between elements unless each group is part of a related subset. Avoid sticking things in the corners or in the middle just because the space is empty.")
                ],
                quizzes: [
                    Question(
                        type: Question.QuestionType.MultipleChoice,
                        title: "After how many items should you consider grouping elements together?",
                        answers: [
                            Answer(text: "15", isCorrect: false),
                            Answer(text: "2", isCorrect: false),
                            Answer(text: "3-5", isCorrect: true),
                            Answer(text: "25-40", isCorrect: false)
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
                lessons: [
                    LessonCard(title: "Primary Colors", image: UIImage(named: "primary_colors") as UIImage?, body: "The color wheel starts with primary colors - yellow, red, blue. Primary colors are the only colors you cannot create from mixing other colors."),
                    LessonCard(title: "Secondary Colors", image: UIImage(named: "secondary_colors") as UIImage?, body: "When you mix equal parts of each primary color with the one next to it to get secondary colors - green, purple, orange."),
                    LessonCard(title: "Tertiary Colors", image: UIImage(named: "tertiary_colors") as UIImage?, body: "And if you mix equal parts of secondary colors, you get tertiary colors...whose names tend to vary."),
                    LessonCard(title: "Device Colors", image: nil, body: "Device screens like this phone in your hand use an RGB color model. This means that they combine parts of red, green, and blue to create a variety of colors. With RGB color, black is the absence of color and white is actually a combination of all colors."),
                    LessonCard(title: "Color Relationships", image: UIImage(named: "tertiary_colors") as UIImage?, body: "With the 12 colors, we can create combinations of colors that are mostly guaranteed to work together. These combinations are called color relationships."),
                    LessonCard(title: "Complementary Colors", image: UIImage(named: "complimentary_colors") as UIImage?, body: "Complementary colors are direct opposites. They work best when one is the main color and the other is an accent color (used sparingly)."),
                    LessonCard(title: "Analogous Colors", image: UIImage(named: "analogous_colors") as UIImage?, body: "Analogous colors are composed of colors that are next to each other on the color wheel. All 2-3 colors share an undertone of the same color, so they match well together."),
                    LessonCard(title: "Triad Colors", image: UIImage(named: "triad_colors") as UIImage?, body: "Triads are a set of 3 colors equidistant from each other. All triads (except primary colors) have underlying colors connecting them, which make them harmonize well with each other."),
                    LessonCard(title: "Shades and Tints", image: UIImage(named: "shades_tints") as UIImage?, body: "So far our color wheel has only been composed of the pure color, known as the hue. We can add black or white to create a variety of colors. Adding black to a hue creates a shade, while adding white creates a tint.")
                ],
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