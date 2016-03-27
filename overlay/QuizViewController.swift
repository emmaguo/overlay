//
//  QuizViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/17/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit
import SCLAlertView
import SimpleAlert

class QuizViewController: UIViewController {
    
    var questionViewController: QuestionViewController?
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var navBackgroundView: UIView!
    
    var topic: Topic!
    var quiz: Quiz!
    var completedQuestions = [Question]()
    var allQuestions: [Question]!
    var currentQuestion: Question!
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: segue from topic view controller
        topic = Topic.allTopics().first!
        quiz = topic.quizzes.first!
        allQuestions = quiz.questions
        currentQuestion = allQuestions.first!
        
        instantiateViewControllerForQuestion(currentQuestion, animated: false)
        
        buttonStyles()
        questionLabel.numberOfLines = 0
        
        navBackgroundView.backgroundColor = topic.color
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonStyles() {
        quizButton.layer.cornerRadius = 5
        quizButton.backgroundColor = lightGray
        quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Disabled)
        quizButton.setTitle("Check", forState: UIControlState.Normal)
    }
    
    func shouldAdvanceToNextQuestion() -> Bool {
        return hasCompletedQuestion(currentQuestion)
    }
    
    func hasCompletedQuestion(question: Question) -> Bool {
        return completedQuestions.contains({ completedQuestion in
            question.id == completedQuestion.id
        })
    }
    
    func advanceToNextQuestionOrSuccess () {
        let uncompletedQuestions = allQuestions.filter { question in
            !hasCompletedQuestion(question)
        }
        
        if let nextQuestion = uncompletedQuestions.first {
            instantiateViewControllerForQuestion(nextQuestion, animated: true)
        } else {
            
            performSegueWithIdentifier("quizSuccessSegue", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "quizSuccessSegue" {
            if let successViewController = segue.destinationViewController as? SuccessViewController {
                successViewController.quizTitle = quiz.title
                successViewController.topicColor = topic.color
            }
        }
    }
    
    
    @IBAction func quizButtonDidTap(sender: UIButton) {
        
        if let questionViewController = questionViewController {
                
            if questionViewController.answerIsCorrect() {
                if shouldAdvanceToNextQuestion() {
                    advanceToNextQuestionOrSuccess()
                    print("Advancing to next quiz")
                } else {
                    questionViewController.showSuccessState()
                    quizButton.backgroundColor = topic.color
                    quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                    quizButton.setTitle("Correct! Next  →", forState: UIControlState.Normal)
                    completedQuestions.append(currentQuestion)
                }
            } else {
                questionViewController.showIncorrectState()
                quizButton.backgroundColor = red
                quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                quizButton.setTitle("Try again", forState: UIControlState.Normal)
            }
        }
    }
    
    func resetQuizButton(enabled: Bool) {
        quizButton.enabled = enabled
        print("enabled \(enabled)")
        if enabled {
            quizButton.backgroundColor = darkGray
            quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            quizButton.setTitle("Check", forState: UIControlState.Normal)
        } else {
            buttonStyles()
        }
    }
    
    func instantiateViewControllerForQuestion(question: Question, animated: Bool) {
        questionLabel.text = question.title
        topicLabel.text = quiz.title
        currentQuestion = question
        
        removeFinishedQuestion()
        
        goToNextQuestion(question, animated: animated)
    }
    
    func removeFinishedQuestion() {
        if let questionViewController = questionViewController {
            questionViewController.removeFromParentViewController()
            contentView.subviews.forEach({ (subview) -> () in
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    subview.frame.origin.x = -375
                    subview.alpha = 0
                    }, completion: { (Bool) -> Void in
                        subview.removeFromSuperview()
                })
            })
        }
    }
    
    func goToNextQuestion(question: Question, animated: Bool) {
        resetQuizButton(false)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        questionViewController = storyboard.instantiateViewControllerWithIdentifier(question.getViewControllerIdentifier()) as? QuestionViewController
        
        if let questionViewController = questionViewController {
            addChildViewController(questionViewController)
            questionViewController.question = question
            questionViewController.quizViewController = self
            contentView.addSubview(questionViewController.view)
            questionViewController.didMoveToParentViewController(self)
            
            if animated {
                questionViewController.view.frame.origin.x = 375
                questionViewController.view.alpha = 0
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    questionViewController.view.frame.origin.x = 0
                    questionViewController.view.alpha = 1
                    }, completion: nil)
            }
            
        }

    }
    
    enum SCLAlertViewStyle: Int {
        case Success, Error, Notice, Warning, Info, Edit, Wait
    }
    
    @IBAction func exitButtonDidTap(sender: AnyObject) {
        let alert = SimpleAlert.Controller(title: "Are you sure?", message: "You will lose all progress if you exit the quiz", style: .Alert)

        alert.configContentView = { [weak self] view in
            if let view = view as? SimpleAlert.ContentView {
                view.frame.size.height = 44
                view.titleLabel.textColor = UIColor.whiteColor()
                view.titleLabel.font = UIFont.boldSystemFontOfSize(36)
                view.messageLabel.textColor = UIColor.whiteColor()
                view.messageLabel.font = UIFont.boldSystemFontOfSize(16)
                view.textBackgroundView.layer.cornerRadius = 4.0
                view.backgroundColor = self!.topic.color
                view.textBackgroundView.clipsToBounds = true
            }
        }
        
        let actionOK = SimpleAlert.Action(title: "Yes", style: .OK)
        let action = SimpleAlert.Action(title: "Cancel", style: .Cancel)

        alert.addAction(actionOK)
        alert.addAction(action)

        alert.addAction(actionOK)
        actionOK.button.frame.size.height = 44
        actionOK.button.titleLabel?.font = UIFont.boldSystemFontOfSize(22)
        actionOK.button.setTitleColor(darkGray, forState: .Normal)
        actionOK.button.backgroundColor = UIColor.whiteColor()
        
        alert.addAction(action)
        action.button.frame.size.height = 44
        action.button.titleLabel?.font = UIFont.systemFontOfSize(22)
        action.button.setTitleColor(darkGray, forState: .Normal)
        action.button.backgroundColor = UIColor.whiteColor()
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    // sclalertview 
    
//    @IBAction func exitButtonDidTap(sender: AnyObject) {
//        // Get started
//        SCLAlertView().showInfo("Important info", subTitle: "You are great")
//        
//        let alertViewResponder: SCLAlertViewResponder = SCLAlertView().showSuccess("Hello World", subTitle: "This is a more descriptive text.")
//        
//        // Upon displaying, change/close view
//        alertViewResponder.setTitle("New Title") // Rename title
//        alertViewResponder.setSubTitle("New description") // Rename subtitle
//        alertViewResponder.close() // Close view
//        
//        let alertView = SCLAlertView()
//        alertView.addButton("First Button", target:self, selector:Selector("firstButton"))
//        alertView.addButton("Second Button") {
//            print("Second button tapped")
//        }
//        alertView.showNotice("Button View", subTitle: "This alert view has buttons")
//        
//        
//    }
//    
    
    
    // original alert
    
    
//    @IBAction func exitButtonDidTap(sender: AnyObject) {
//        let alertController = UIAlertController(title: "Are you sure?", message: "Your progress in this quiz will be lost", preferredStyle: .Alert)
//        
//        alertController.view.tintColor = darkGray
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
//            // handle cancel response here. ADD SEGUE BACK TO TOPIC VIEW CONTROLLER
//        }
//        
//        alertController.addAction(cancelAction)
//        
//        
//        let OKAction = UIAlertAction(title: "Yes", style: .Default) { (action) in
//            
//        }
//        
//        alertController.addAction(OKAction)
//        
//        presentViewController(alertController, animated: true) {
//            
//        }
//        
//    }

    
    
    
    
    
}
