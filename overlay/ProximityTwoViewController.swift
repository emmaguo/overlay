//
//  ProximityTwoViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/21/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class ProximityTwoViewController: QuestionViewController {

    var cardViews: [UIView]!
    @IBOutlet weak var cardOneView: UIView!
    @IBOutlet weak var cardTwoView: UIView!
    
    var selectedView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardViews = [cardOneView, cardTwoView]

        resetCardViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetCardViews() {
        cardViews.forEach { (cardView) -> () in
            cardView.addDefaultBorderInactive()
        }
    }
    

    @IBAction func cardDidTap(sender: UITapGestureRecognizer) {
        
        resetCardViews()
//        sender.view!.addDefaultBorderActive()
        sender.view!.addDefaultBorderActive(proximityColor.CGColor)
        selectedView = sender.view
        resetQuizButton()
        
    }
    
    override func answerIsCorrect() -> Bool {
        
        if let selectedView = selectedView {
            return selectedView == cardTwoView
        } else {
            return false
        }
        
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
