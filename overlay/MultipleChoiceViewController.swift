//
//  MultipleChoiceViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: QuestionViewController {
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var ATextLabel: UILabel!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var BTextLabel: UILabel!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var CTextLabel: UILabel!
    @IBOutlet weak var DButton: UIButton!
    @IBOutlet weak var DTextLabel: UILabel!
    @IBOutlet weak var answerCorrectImage: UIImageView!
    
    var selectedAnswer: Answer?
    var selectedButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ATextLabel.numberOfLines = 0
        BTextLabel.numberOfLines = 0
        CTextLabel.numberOfLines = 0
        DTextLabel.numberOfLines = 0
        
        ATextLabel.text = question.answers[0].text
        BTextLabel.text = question.answers[1].text
        CTextLabel.text = question.answers[2].text
        DTextLabel.text = question.answers[3].text
        
        answerCorrectImage.layer.cornerRadius = 25
    }
    
    @IBAction func onAnswerButtonDidTap(sender: UIButton) {
        AButton.selected = false
        BButton.selected = false
        CButton.selected = false
        DButton.selected = false
        
        selectedAnswer = question.answers[sender.tag]
        sender.selected = true
        selectedButton = sender
        
        if let quizViewController = quizViewController {
            quizViewController.resetQuizButton(true)
        }
    }
    
    override func answerIsCorrect() -> Bool {
        return (selectedAnswer?.isCorrect)!
    }
    
    override func showSuccessState() {
        let correctImage = UIImage(named: "button_correct") as UIImage?
        selectedButton!.setImage(correctImage, forState: .Selected)
    }
    
    override func showIncorrectState() {
        let incorrectImage = UIImage(named: "button_incorrect") as UIImage?
        selectedButton!.setImage(incorrectImage, forState: .Selected)
    }

}
