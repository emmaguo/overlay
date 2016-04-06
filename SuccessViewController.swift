//
//  SuccessViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/19/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class SuccessViewController: UIViewController {
    
    @IBOutlet weak var initialDotView: UIView!
    @IBOutlet weak var fillDotView: UIView!
    @IBOutlet weak var quizTitleLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!
    @IBOutlet weak var achievedLabel: UILabel!
    
    var quizTitle: String!
    var topicColor: UIColor!
    var topicIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        initialDotView.backgroundColor = UIColor.clearColor()
        initialDotView.layer.cornerRadius = 33
        initialDotView.layer.borderWidth = 6
        initialDotView.layer.borderColor = topicColor.CGColor
        fillDotView.alpha = 0
        fillDotView.backgroundColor = topicColor
        
        initialDotView.center.y = -50
        quizTitleLabel.alpha = 0
        achievedLabel.alpha = 0
        checkmarkImageView.center.y = 680
        
        quizTitleLabel.text = quizTitle
    }
    
    override func viewDidAppear(animated: Bool) {
        successAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func successAnimation() {
        UIView.animateWithDuration(0.8, delay: 0.4, usingSpringWithDamping: 10.0, initialSpringVelocity: 20, options: [ ], animations: { () -> Void in
            // initial dot translated town with the fill
            self.initialDotView.center.y = 333
            self.fillDotView.alpha = 1
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                // dot fills up
                self.fillDotView.transform = CGAffineTransformMakeScale(40, 40)
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    // initial dot grows and title fades in
                    self.initialDotView.transform = CGAffineTransformMakeScale(20, 20)
                    self.quizTitleLabel.alpha = 1
                }, completion: { (Bool) -> Void in
                    UIView.animateWithDuration(0.8, delay: 0.1, usingSpringWithDamping: 5.0, initialSpringVelocity: 0.5, options: [ ], animations: { () -> Void in
                        // check mark translates up and bumps quiz title up
                        self.checkmarkImageView.center.y = 363
                        self.achievedLabel.center.y = 360
                                    
                        UIView.animateWithDuration(0.1, delay: 0.6, usingSpringWithDamping: 5.0, initialSpringVelocity: 0.5, options: [ ], animations: { () -> Void in
                            // quiz title bumped up a little
                            self.quizTitleLabel.center.y = 320
                        }, completion: { (Bool) -> Void in
                            // nothing goes here
                        })
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 5.0, initialSpringVelocity: 0.5, options: [ ], animations: { () -> Void in
                            // Achievement label comes in and bumps checkmark left
                            self.achievedLabel.alpha = 1
                            self.achievedLabel.center.x = 205
                            self.checkmarkImageView.center.x = 135
                        }, completion: { (Bool) -> Void in
                            // call manual segue here
                            self.performSegueWithIdentifier("subjectCompletionSegue", sender: self)
                        })
                    })
                })
            })
        }
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let topicViewController = segue.destinationViewController as! TopicViewController
        topicViewController.topicIndex = topicIndex
    }
}
