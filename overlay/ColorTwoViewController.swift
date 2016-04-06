//
//  ColorTwoViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class ColorTwoViewController: QuestionViewController {
    
    var colorViews: [UIView]!
    var selectedViews = [UIView]()
    var correctViews: [UIView]!
    
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorViews = [redView, greenView, blueView, yellowView, orangeView, purpleView]
        correctViews = [greenView, orangeView, purpleView]
        
        resetColorViews()
        
        colorViews.forEach { (colorView) -> () in
            colorView.layer.cornerRadius = 30
            colorView.userInteractionEnabled = true
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetColorViews() {
        
        colorViews.forEach { (colorView) -> () in
            colorView.removeColorBorder()
        }
        
        redView.backgroundColor = red
        greenView.backgroundColor = green
        blueView.backgroundColor = blue
        yellowView.backgroundColor = yellow
        orangeView.backgroundColor = orange
        purpleView.backgroundColor = purple
    }
    
    @IBAction func colorDidTap(sender: UITapGestureRecognizer) {
//                resetColorViews()
        
        if let viewIndex = selectedViews.indexOf(sender.view!) {
            sender.view!.removeColorBorder()
            selectedViews.removeAtIndex(viewIndex)
        } else {
            sender.view!.addColorBorder()
            selectedViews.append(sender.view!)
        }
        resetQuizButton()
    }
    
    
    
    override func answerIsCorrect() -> Bool {
        
        return selectedViews == correctViews
        
    }
    
    func resetQuizButton() {
        quizViewController.resetQuizButton(true)
    }


}
