//
//  QuizViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/17/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var multipleChoiceViewController: MultipleChoiceViewController!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var quizButton: UIButton!
    
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        multipleChoiceViewController = storyboard.instantiateViewControllerWithIdentifier("MultipleChoiceViewController") as! MultipleChoiceViewController
        
        addChildViewController(multipleChoiceViewController)
        
        // In this case, we're adding the child view controller to the main view. However, you might also be adding the child view controller to another view that you've defined in the container view.
        contentView.addSubview(multipleChoiceViewController.view)
        multipleChoiceViewController.didMoveToParentViewController(self)
        
        buttonStyles()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonStyles() {
        quizButton.layer.cornerRadius = 5
        quizButton.backgroundColor = lightGray
        quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Disabled)
    }
    
    
    
    @IBAction func quizButtonDidTap(sender: UIButton) {
        let correctImage = UIImage(named: "button_correct") as UIImage?
        let incorrectImage = UIImage(named: "button_incorrect") as UIImage?
            
        if let selectedAnswer = multipleChoiceViewController.selectedAnswer, selectedButton = multipleChoiceViewController.selectedButton {
            print(selectedAnswer.isCorrect)
                
            if selectedAnswer.isCorrect {
                selectedButton.setImage(correctImage, forState: .Selected)
                quizButton.backgroundColor = green
                quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                quizButton.setTitle("Correct! Next  →", forState: UIControlState.Normal)
            } else {
                selectedButton.setImage(incorrectImage, forState: .Selected)
                quizButton.backgroundColor = red
                quizButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                quizButton.setTitle("Try again", forState: UIControlState.Normal)
            }
        }
    }
    
    
}
