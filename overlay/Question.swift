//
//  Question.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

class Question {
    
    enum QuestionType {
        case MultipleChoice, ProximityDragOne, ProximityTwo, ProximityThree, ColorOne
    }
    
    let id: Int
    let type: QuestionType
    let title: String
    let answers: [Answer]
    
    init(id: Int, type: QuestionType, title: String, answers: [Answer]) {
        self.id = id
        self.type = type
        self.title = title
        self.answers = answers
    }
    
    func getViewControllerIdentifier() -> String {
        switch type {
        case .MultipleChoice: return "MultipleChoiceViewController"
        case .ProximityDragOne: return "ProximityOneViewController"
        case .ProximityTwo: return "ProximityTwoViewController"
        case .ProximityThree: return "ProximityThreeViewController"
        case .ColorOne: return "ColorOneViewController"
        }
    }

}
