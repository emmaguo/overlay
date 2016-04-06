//
//  ColorOneViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/27/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class ColorOneViewController: QuestionViewController {
    
    var colorViews: [UIView]!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var purpleView: UIView!
    
    var selectedViews = [UIView]()
    var correctViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorViews = [redView, greenView, blueView, yellowView, orangeView, purpleView]
        correctViews = [redView, blueView, yellowView]
        
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
        
        return selectedViews == correctViews
        
    }
    
    func resetQuizButton() {
        quizViewController.resetQuizButton(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
