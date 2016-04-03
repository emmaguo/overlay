//
//  ProximityThreeViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/23/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class ProximityThreeViewController: QuestionViewController {
    
    var labelOriginalCenter: CGPoint!
    var labelCenter: UIView!
    var labelCenterPoint: CGPoint!
    
    @IBOutlet weak var zoneOneView: UIView!
    @IBOutlet weak var zoneTwoView: UIView!
    @IBOutlet weak var zoneOneTopView: UIView!
    @IBOutlet weak var zoneOneBottomView: UIView!
    @IBOutlet weak var zoneTwoTopView: UIView!
    @IBOutlet weak var zoneTwoBottomView: UIView!
    
    // labels
    var allLabels: [UIView]!
    var fontLabels: [UIView]!
    var colorLabels: [UIView]!
    var fontTitleLabel: [UIView]!
    var colorTitleLabel: [UIView]!
    
    @IBOutlet weak var fontView: UIView!
    @IBOutlet weak var colorView: UIView!
   
    @IBOutlet weak var colorOneView: UIView!
    @IBOutlet weak var colorTwoView: UIView!
    @IBOutlet weak var colorThreeView: UIView!
    @IBOutlet weak var colorFourView: UIView!
    @IBOutlet weak var colorFiveView: UIView!
    
    @IBOutlet weak var fontOneView: UIView!
    @IBOutlet weak var fontTwoView: UIView!
    @IBOutlet weak var fontThreeView: UIView!
    @IBOutlet weak var fontFourView: UIView!
    @IBOutlet weak var fontFiveView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allLabels = [fontView, colorView, fontOneView, fontTwoView, fontThreeView, fontFourView, fontFiveView, colorOneView, colorTwoView, colorThreeView, colorFourView, colorFiveView]
        
        fontLabels = [fontOneView, fontTwoView, fontThreeView, fontFourView, fontFiveView]
        colorLabels = [colorOneView, colorTwoView, colorThreeView, colorFourView, colorFiveView]
        fontTitleLabel = [fontView]
        colorTitleLabel = [colorView]
        
        zoneOneView.addInactiveDashedBorder()
        zoneTwoView.addInactiveDashedBorder()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanLabel:")
        
        allLabels.forEach { (eachLabel) -> () in
            eachLabel.backgroundColor = proximityColor
            eachLabel.layer.cornerRadius = 4
            eachLabel.userInteractionEnabled = true
            eachLabel.addGestureRecognizer(panGestureRecognizer)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didPanLabel(sender: UIPanGestureRecognizer) {
        let point = sender.locationInView(view)
        let translation = sender.translationInView(view)
        let labelView = sender.view as! UIView!
        
        if sender.state == UIGestureRecognizerState.Began {
            resetQuizButton()
            print("Gesture began at: \(point)")
            labelOriginalCenter = labelView.center
            view.bringSubviewToFront(labelView)
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                labelView.transform = CGAffineTransformMakeScale(1.4, 1.4)
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            labelView.center = CGPoint(x: labelOriginalCenter.x + translation.x, y: labelOriginalCenter.y + translation.y)
            zoneOneView.addActiveDashedBorder()
            zoneTwoView.addActiveDashedBorder()
            
            if isInView(zoneTwoView, label: labelView) {
                zoneTwoView.addSelectedBorder()
            } else if isInView(zoneOneView, label: labelView) {
                zoneOneView.addSelectedBorder()
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            print("Gesture ended at: \(point)")
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                labelView.transform = CGAffineTransformMakeScale(1.1, 1.1)
            })
            
            print(zoneTwoBottomView.frame)
            
            zoneOneView.addInactiveDashedBorder()
            zoneTwoView.addInactiveDashedBorder()
            
            if isInView(zoneTwoBottomView, label: labelView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    labelView.center = CGPoint(x: self.zoneTwoBottomView.center.x, y: labelView.center.y)
                })
            } else if isInView(zoneOneBottomView, label: labelView) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    labelView.center = CGPoint(x: self.zoneOneBottomView.center.x, y: labelView.center.y)
                })
            } else if isInView(zoneTwoTopView, label: labelView){
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    labelView.center = CGPoint(x: self.zoneTwoTopView.center.x - 16, y: self.zoneTwoTopView.center.y)
                })
            } else if isInView(zoneOneTopView, label: labelView){
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    labelView.center = CGPoint(x: self.zoneOneTopView.center.x - 16, y: self.zoneOneTopView.center.y)
                })
            }
        }
        
    }
    
    override func answerIsCorrect() -> Bool {
        
        let allColorInZoneOne = allInArray(colorLabels) { eachLabel in self.isInView(self.zoneOneBottomView, label: eachLabel) }
        let allColorInZoneTwo = allInArray(colorLabels) { eachLabel in self.isInView(self.zoneTwoBottomView, label: eachLabel) }
        let allFontInZoneOne = allInArray(fontLabels) { eachLabel in self.isInView(self.zoneOneBottomView, label: eachLabel) }
        let allFontInZoneTwo = allInArray(fontLabels) { eachLabel in self.isInView(self.zoneTwoBottomView, label: eachLabel) }
        let colorTitleInZoneOne = allInArray(colorTitleLabel) { eachLabel in self.isInView(self.zoneOneTopView, label: eachLabel) }
        let colorTitleInZoneTwo = allInArray(colorTitleLabel) { eachLabel in self.isInView(self.zoneTwoTopView, label: eachLabel) }
        let fontTitleInZoneOne = allInArray(fontTitleLabel) { eachLabel in self.isInView(self.zoneOneTopView, label: eachLabel) }
        let fontTitleInZoneTwo = allInArray(fontTitleLabel) { eachLabel in self.isInView(self.zoneTwoTopView, label: eachLabel) }
        
        return (allColorInZoneOne && colorTitleInZoneOne && allFontInZoneTwo && fontTitleInZoneTwo) || (allColorInZoneTwo && colorTitleInZoneTwo && allFontInZoneOne && fontTitleInZoneOne)
        return true
    }
    
    func resetQuizButton() {
        quizViewController.resetQuizButton(true)
    }
    
    func allInArray(views: [UIView], predicate: (UIView) -> Bool) -> Bool {
        return views.filter(predicate).count == views.count
    }
    
    func isInView(container: UIView, label: UIView) -> Bool {
        let frame = container.frame
        print(container)
        return label.center.x > frame.minX &&
               label.center.x < frame.maxX &&
               label.center.y > frame.minY &&
               label.center.y < frame.maxY
    }


}
