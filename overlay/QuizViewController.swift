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
    @IBOutlet weak var closeImageView: UIImageView!
    @IBOutlet weak var endFadeView: UIView!
    
    var topic: Topic!
    var subject: Subject!
    var completedQuestions = [Question]()
    var allQuestions: [Question]!
    var currentQuestion: Question!
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: segue from topic view controller
        topic = OverlayData.first!
        subject = topic.subjects.first!
        allQuestions = subject.quizzes
        currentQuestion = allQuestions.first!
        
        instantiateViewControllerForQuestion(currentQuestion, animated: false)
        
        buttonStyles()
        cardStyles()
        questionLabel.numberOfLines = 0
        endFadeView.alpha = 0
        
        navBackgroundView.backgroundColor = topic.color
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonStyles() {
        quizButton.layer.cornerRadius = 4
        quizButton.backgroundColor = lightGray
        quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Disabled)
        quizButton.setTitle("Check", forState: UIControlState.Normal)
    }
    
    func cardStyles() {
//        var quizCard = UIView(frame: CGRectMake((lessonCount)*contentWidth+6, 100, 320, 244))
        contentView.backgroundColor = UIColor(hexString: "#FFFFFF")
        contentView.layer.cornerRadius = 16.0
        endFadeView.layer.cornerRadius = 16.0
        contentView.layer.shadowColor = UIColor.blackColor().CGColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = CGSizeZero
        contentView.layer.shadowRadius = 16
    
        var quizBody = UILabel(frame: CGRectMake(24, 66, 272, 400))
        questionLabel.textColor = darkGray
        questionLabel.font = UIFont(name:"Avenir", size: 18.0)
        questionLabel.textAlignment = NSTextAlignment.Center
        questionLabel.numberOfLines = 2    
    }
    
    func shouldAdvanceToNextQuestion() -> Bool {
        return hasCompletedQuestion(currentQuestion)
    }
    
    func hasCompletedQuestion(question: Question) -> Bool {
//        return completedQuestions.contains({ completedQuestion in
//            question.id == completedQuestion.id
//        })
        return false
    }
    
    func advanceToNextQuestionOrSuccess () {
        let uncompletedQuestions = allQuestions.filter { question in
            !hasCompletedQuestion(question)
        }
        
        if let nextQuestion = uncompletedQuestions.first {
            instantiateViewControllerForQuestion(nextQuestion, animated: true)
        } else {
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.topicLabel.alpha = 0
                self.questionLabel.alpha = 0
                self.closeImageView.alpha = 0
                self.quizButton.alpha = 0
                self.endFadeView.alpha = 1
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.8, animations: { () -> Void in
                    self.endFadeView.transform = CGAffineTransformMakeScale(1.3, 1.9)
                }, completion: { (Bool) -> Void in
                    self.performSegueWithIdentifier("quizSuccessSegue", sender: self)
                })
            })
            
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "quizSuccessSegue" {
            if let successViewController = segue.destinationViewController as? SuccessViewController {
                successViewController.quizTitle = subject.name
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
                    quizButton.backgroundColor = green
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
        topicLabel.text = subject.name
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
                view.titleLabel.textColor = UIColor.whiteColor()
                view.titleLabel.font = UIFont.boldSystemFontOfSize(26)
                view.messageLabel.textColor = UIColor.whiteColor()
                view.messageLabel.font = UIFont.systemFontOfSize(18)
                view.textBackgroundView.layer.cornerRadius = 4.0
                view.backgroundColor = darkGray
                view.textBackgroundView.clipsToBounds = true
            }
        }
        
        let action = SimpleAlert.Action(title: "Cancel", style: .Cancel)
        let actionOK = SimpleAlert.Action(title: "Yes", style: .OK)
        
        alert.addAction(action)
//        action.button.frame.size.height = 44
        action.button.titleLabel?.font = UIFont.systemFontOfSize(18)
        action.button.setTitleColor(darkGray, forState: .Normal)
        action.button.backgroundColor = UIColor.whiteColor()
        
        alert.addAction(actionOK)
//        actionOK.button.frame.size.height = 44
        actionOK.button.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        actionOK.button.setTitleColor(darkGray, forState: .Normal)
        actionOK.button.backgroundColor = UIColor.whiteColor()
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
}
