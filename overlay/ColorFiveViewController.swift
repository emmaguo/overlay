//
//  ColorFiveViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 4/4/16.
//  Copyright © 2016 overlay. All rights reserved.
//


import UIKit

class ColorFiveViewController: QuestionViewController {
    
    var shapeOriginalCenter: CGPoint!
    var shapeCenter: UIView!
    var shapeCenterPoint: CGPoint!
    
    @IBOutlet weak var zoneOneView: UIView!
    @IBOutlet weak var outsideView: UIView!
    
    // first type of shape
    var whiteUnit: [UIView]!
    var blackUnit: [UIView]!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blackView: UIView!
    
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whiteUnit = [whiteView]
        blackUnit = [blackView]
        
        zoneOneView.addInactiveDashedBorder()
        colorView.backgroundColor = green
        colorView.layer.cornerRadius = 5
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanShape:")
        
        whiteUnit.forEach { (whiteUnit) -> () in
            whiteUnit.backgroundColor = offWhite
            whiteUnit.layer.cornerRadius = 5
            whiteUnit.userInteractionEnabled = true
            whiteUnit.addGestureRecognizer(panGestureRecognizer)
            whiteUnit.transform = CGAffineTransformMakeScale(0.7, 0.7)
        }
        
        blackUnit.forEach { (blackUnit) -> () in
            blackUnit.backgroundColor = darkGray
            blackUnit.layer.cornerRadius = 5
            blackUnit.userInteractionEnabled = true
            blackUnit.addGestureRecognizer(panGestureRecognizer)
            blackUnit.transform = CGAffineTransformMakeScale(0.7, 0.7)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func didPanShape(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let shapeView = sender.view as! UIView!
        
        if sender.state == UIGestureRecognizerState.Began {
            resetQuizButton()
            print("Gesture began at: \(point)")
            shapeOriginalCenter = shapeView.center
            view.bringSubviewToFront(shapeView)
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                shapeView.transform = CGAffineTransformMakeScale(0.9, 0.9)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            shapeView.center = CGPoint(x: shapeOriginalCenter.x + translation.x, y: shapeOriginalCenter.y + translation.y)
            zoneOneView.addActiveDashedBorder()
            
            if isInView(zoneOneView, shape: shapeView) {
                zoneOneView.addSelectedBorder()
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                shapeView.transform = CGAffineTransformMakeScale(0.7, 0.7)
            })
            
            zoneOneView.addInactiveDashedBorder()
            
            if isInView(zoneOneView, shape: blackView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.blackView.center = CGPoint(x: self.zoneOneView.center.x, y: self.zoneOneView.center.y)
                    self.blackView.backgroundColor = greenShade
                })
            } else if isInView(zoneOneView, shape: whiteView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.whiteView.center = CGPoint(x: self.zoneOneView.center.x, y: self.zoneOneView.center.y)
                    self.whiteView.backgroundColor = greenTint
                })
            } else if isInView(outsideView, shape: whiteView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.whiteView.backgroundColor = offWhite
                })
            } else if isInView(outsideView, shape: blackView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.whiteView.backgroundColor = darkGray
                })
                
            } else {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    shapeView.center = self.shapeOriginalCenter
                })
            }
        }
    }
    
    override func answerIsCorrect() -> Bool {
        let whiteInZoneOne = allInArray(blackUnit) { whiteUnit in self.isInView(self.zoneOneView, shape: whiteUnit) }
        let blackInOutsideZone = allInArray(whiteUnit) { blackUnit in self.isInView(self.outsideView, shape: blackUnit) }
        
        return whiteInZoneOne && blackInOutsideZone
    }
    
    func resetQuizButton() {
        quizViewController.resetQuizButton(true)
    }
    
    func allInArray(views: [UIView], predicate: (UIView) -> Bool) -> Bool {
        return views.filter(predicate).count == views.count
    }
    
    func isInView(container: UIView, shape: UIView) -> Bool {
        let frame = container.frame
        
        return shape.center.x > frame.minX &&
            shape.center.x < frame.maxX &&
            shape.center.y > frame.minY &&
            shape.center.y < frame.maxY
    }
}