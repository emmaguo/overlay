//
//  QuizViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/17/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

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
    let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
    
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
    
}
