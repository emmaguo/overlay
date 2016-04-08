//
//  ProximityOneViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class ProximityOneViewController: QuestionViewController {

    var shapeOriginalCenter: CGPoint!
    var shapeCenter: UIView!
    var shapeCenterPoint: CGPoint!
    
    @IBOutlet weak var zoneOneView: UIView!
    @IBOutlet weak var zoneTwoView: UIView!
    
    // first type of shape
    var aUnits: [UIView]!
    @IBOutlet weak var unitAOne: UIView!
    @IBOutlet weak var unitATwo: UIView!
    @IBOutlet weak var unitAThree: UIView!
    
    //second type of shape
    var bUnits: [UIView]!
    @IBOutlet weak var unitBOne: UIView!
    @IBOutlet weak var unitBTwo: UIView!
    @IBOutlet weak var unitBThree: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aUnits = [unitAOne, unitATwo, unitAThree]
        bUnits = [unitBOne, unitBTwo, unitBThree]
        
        zoneOneView.addInactiveDashedBorder()
        zoneTwoView.addInactiveDashedBorder()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanShape:")
        
        aUnits.forEach { (aUnit) -> () in
            aUnit.backgroundColor = proximityColor
            aUnit.layer.cornerRadius = 30
            aUnit.userInteractionEnabled = true
            aUnit.addGestureRecognizer(panGestureRecognizer)
        }
        
        bUnits.forEach { (bUnit) -> () in
            bUnit.backgroundColor = alignmentColor
            bUnit.layer.cornerRadius = 5
            bUnit.userInteractionEnabled = true
            bUnit.addGestureRecognizer(panGestureRecognizer)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
 
    @IBAction func didPanShape(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let shapeView = sender.view! as UIView
        
        if sender.state == UIGestureRecognizerState.Began {
            resetQuizButton()
            print("Gesture began at: \(point)")
            shapeOriginalCenter = shapeView.center
            view.bringSubviewToFront(shapeView)
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                shapeView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            shapeView.center = CGPoint(x: shapeOriginalCenter.x + translation.x, y: shapeOriginalCenter.y + translation.y)
            zoneOneView.addActiveDashedBorder()
            zoneTwoView.addActiveDashedBorder()
            
            if isInView(zoneTwoView, shape: shapeView) {
                zoneTwoView.addSelectedBorder()
            } else if isInView(zoneOneView, shape: shapeView) {
                zoneOneView.addSelectedBorder()
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                shapeView.transform = CGAffineTransformMakeScale(1.1, 1.1)
            })
            
            zoneOneView.addInactiveDashedBorder()
            zoneTwoView.addInactiveDashedBorder()
            
            if isInView(zoneTwoView, shape: shapeView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    shapeView.center = CGPoint(x: shapeView.center.x, y: self.zoneTwoView.center.y)
                })
            } else if isInView(zoneOneView, shape: shapeView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    shapeView.center = CGPoint(x: shapeView.center.x, y: self.zoneOneView.center.y)
                })

            } else {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    shapeView.center = self.shapeOriginalCenter
                })
            }
        }
    }
    
    override func answerIsCorrect() -> Bool {
        let allAInZoneOne = allInArray(aUnits) { aUnit in self.isInView(self.zoneOneView, shape: aUnit) }
        let allBInZoneTwo = allInArray(bUnits) { bUnit in self.isInView(self.zoneTwoView, shape: bUnit) }
        let allAInZoneTwo = allInArray(aUnits) { aUnit in self.isInView(self.zoneTwoView, shape: aUnit) }
        let allBInZoneOne = allInArray(bUnits) { bUnit in self.isInView(self.zoneOneView, shape: bUnit) }
        
        return (allAInZoneOne && allBInZoneTwo) || (allAInZoneTwo && allBInZoneOne)
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
