//
//  ColorSixViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//


import UIKit

class ColorSixViewController: QuestionViewController {
    
    var colorViews: [UIView]!
    var redTriadViews: [UIView]!
    var orangeTriadViews: [UIView]!
    var orangeRedTriadViews: [UIView]!
    var yellowOrangeTriadViews: [UIView]!
    var selectedViews = [UIView]()
    var correctViews: [UIView]!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var redOrangeView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var orangeYellowView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var yellowGreenView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var greenBlueView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var bluePurpleView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var purpleRedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorViews = [redView, redOrangeView, orangeView, orangeYellowView, yellowView, yellowGreenView, greenView, greenBlueView, blueView, bluePurpleView, purpleView, purpleRedView]
        redTriadViews = [redView, yellowView, blueView]
        orangeTriadViews = [orangeView, greenView, purpleView]
        orangeRedTriadViews = [redOrangeView, yellowGreenView, bluePurpleView]
        yellowOrangeTriadViews = [orangeYellowView, greenBlueView, purpleRedView]
        
        resetColorViews()
        
        colorViews.forEach { (colorView) -> () in
            colorView.layer.cornerRadius = 20
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
        redOrangeView.backgroundColor = redOrange
        greenView.backgroundColor = green
        orangeYellowView.backgroundColor = yellowOrange
        blueView.backgroundColor = blue
        yellowGreenView.backgroundColor = yellowGreen
        yellowView.backgroundColor = yellow
        greenBlueView.backgroundColor = blueGreen
        orangeView.backgroundColor = orange
        bluePurpleView.backgroundColor = bluePurple
        purpleView.backgroundColor = purple
        purpleRedView.backgroundColor = redPurple
        
    }
    
    @IBAction func colorDidTap(sender: UITapGestureRecognizer) {
        //        resetColorViews()
        
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
        
        return selectedViews == redTriadViews || selectedViews == orangeTriadViews || selectedViews == orangeRedTriadViews || selectedViews == yellowOrangeTriadViews
        
    }
    
    func resetQuizButton() {
        quizViewController.resetQuizButton(true)
    }
    
    
}