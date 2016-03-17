//
//  MultipleChoiceViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var ATextLabel: UILabel!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var BTextLabel: UILabel!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var CTextLabel: UILabel!
    @IBOutlet weak var DButton: UIButton!
    @IBOutlet weak var DTextLabel: UILabel!
    
    var question: Question!
    var selectedAnswer: Answer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // fix via HomeViewController on segue
        let topics = Topic.allTopics()
        let topic = topics.first!
        let quiz = topic.quizzes.first!
        self.question = quiz.questions.first!
        
        ATextLabel.text = question.answers[0].text
        BTextLabel.text = question.answers[1].text
        CTextLabel.text = question.answers[2].text
        DTextLabel.text = question.answers[3].text
        
        
        
    }
    
    @IBAction func onAnswerButtonDidTap(sender: UIButton) {
        selectedAnswer = question.answers[sender.tag]
    }
    
    @IBAction func tempButtonDidTap(sender: UIButton) {
        if let selectedAnswer = selectedAnswer {
            print(selectedAnswer.isCorrect)
        }
    }
}
