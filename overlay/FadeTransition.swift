//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let startPosition = toViewController.view.frame.origin.x + 370
        let endPosition = toViewController.view.frame.origin.x
        
        UIView.animateWithDuration(0, animations: { () -> Void in
            toViewController.view.frame.origin.x = startPosition
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.53, animations: {
                    toViewController.view.frame.origin.x = endPosition
                }) { (Bool) -> Void in
                    self.finish()
                }
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        print("do you see me?")
        let fromStartPosition = fromViewController.view.frame.origin.x
        let fromEndPosition = fromViewController.view.frame.origin.x - 375
        
        
        UIView.animateWithDuration(0.62, animations: { () -> Void in
            fromViewController.view.frame.origin.x = fromEndPosition
            }) { (Bool) -> Void in
                self.finish()
        }
//        
//        UIView.animateWithDuration(0, animations: { () -> Void in
//            fromViewController.view.frame.origin.x = fromStartPosition
//            }) { (Bool) -> Void in
//                UIView.animateWithDuration(0.3, animations: {
//                    fromViewController.view.frame.origin.x = fromEndPosition
//                    }) { (Bool) -> Void in
//                        self.finish()
//                }
//        }
        
    }
    
}
