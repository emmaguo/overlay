//
//  Question.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

class Question {

    let type: QuestionType
    let title: String
    let answers: [Answer]
    
    init(type: QuestionType, title: String, answers: [Answer]) {
        self.type = type
        self.title = title
        self.answers = answers
    }
    
    enum QuestionType {
        case MultipleChoice
        case ProximityDragOne
        case ProximityTwo
        case ProximityThree
        case ColorOne
        case ColorTwo
        case ColorThree
        case ColorFour
        case ColorFive
        case ColorSix
    }
    
    func getViewControllerIdentifier() -> String {
        switch type {
        case .MultipleChoice: return "MultipleChoiceViewController"
        case .ProximityDragOne: return "ProximityOneViewController"
        case .ProximityTwo: return "ProximityTwoViewController"
        case .ProximityThree: return "ProximityThreeViewController"
        case .ColorOne: return "ColorOneViewController"
        case .ColorTwo: return "ColorTwoViewController"
        case .ColorThree: return "ColorThreeViewController"
        case .ColorFour: return "ColorFourViewController"
        case .ColorFive: return "ColorFiveViewController"
        case .ColorSix: return "ColorSixViewController"
        }
    }
}