//
//  LaunchViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/27/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var outlineView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var contrastView: UIView!
    @IBOutlet weak var repetitionView: UIView!
    @IBOutlet weak var alignmentView: UIView!
    @IBOutlet weak var proximityView: UIView!
    
    var colorViews: [UIView]!
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorViews = [colorView, contrastView, repetitionView, alignmentView, proximityView]
        
        outlineView.frame.origin.y = -170
        
        loadingAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadingAnimation() {
        animationStyles()
        
        UIView.animateWithDuration(0.8, delay: 1.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
                self.outlineView.frame.origin.y = 254
            
            }) { (Bool) -> Void in
                UIView.animateWithDuration(1.3, delay: 0.2, options: [], animations: { () -> Void in
                   
                    self.colorViews.forEach { (colorView) -> () in
                        colorView.frame.size.height = 100
                    }
                    
                    self.proximityView.frame.origin.y = 0
                    self.alignmentView.frame.origin.y = 32
                    self.repetitionView.frame.origin.y = 64
                    self.contrastView.frame.origin.y = 96
                    self.colorView.frame.origin.y = 128
                
                    }) { (Bool) -> Void in
                        // completion
                        self.performSegueWithIdentifier("homeSegue", sender: self)
                }
        }
    }

    func animationStyles() {
        outlineView.layer.cornerRadius = 80
        outlineView.backgroundColor = lightestGray
        colorView.backgroundColor = colorColor
        contrastView.backgroundColor = contrastColor
        repetitionView.backgroundColor = repetitionColor
        alignmentView.backgroundColor = alignmentColor
        proximityView.backgroundColor = proximityColor
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let homeViewController = segue.destinationViewController as! HomeViewController
        homeViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        fadeTransition = FadeTransition()
        homeViewController.transitioningDelegate = fadeTransition
        fadeTransition.duration = 1.0
    }
}
