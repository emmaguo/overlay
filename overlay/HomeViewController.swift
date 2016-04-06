//
//  HomeViewController.swift
//  overlay
//
//  Created by Emma Guo on 3/13/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    var homeTableViewHeight: CGFloat!
    var originalTableViewOrigin: CGPoint!
    var originalTableViewSize: CGSize!

    @IBOutlet weak var globalProgressCircle: UIView!
    @IBOutlet weak var globalTitleLabel: UILabel!
    @IBOutlet weak var globalBodyLabel: UILabel!
    
    @IBOutlet weak var globalProgressCircleFill: UIView!
    @IBOutlet weak var colorProgressView: UIView!
    @IBOutlet weak var contrastProgressView: UIView!
    @IBOutlet weak var repetitionProgressView: UIView!
    @IBOutlet weak var alignmentProgressView: UIView!
    @IBOutlet weak var proximityProgressView: UIView!
    
    @IBOutlet weak var caretImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = mainBackgroundColor
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.rowHeight = calculateRowHeight()
        homeTableViewHeight = homeTableView.frame.height
        
        globalProgressStyles()
        globalProgressFillStyles()
        globalTextContent()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent

    }
    
    func globalProgressStyles() {
        globalProgressCircle.addCircleBorder()
    }
    
    func globalProgressFillStyles() {
        colorProgressView.backgroundColor = colorColor
        contrastProgressView.backgroundColor = contrastColor
        repetitionProgressView.backgroundColor = repetitionColor
        alignmentProgressView.backgroundColor = alignmentColor
        proximityProgressView.backgroundColor = proximityColor
        
        colorProgressView.alpha = 0
        contrastProgressView.alpha = 0
        repetitionProgressView.alpha = 0
        alignmentProgressView.alpha = 0
        proximityProgressView.alpha = 0
        
        globalProgressCircleFill.clipsToBounds = true
        globalProgressCircleFill.layer.cornerRadius = 75
    }
    
    func globalTextContent() {
    
        globalTitleLabel.numberOfLines = 0
        globalBodyLabel.numberOfLines = 2

        globalTitleLabel.text = "You're just getting started"
        globalBodyLabel.text = "Complete quizzes to get your fill of design thinking and progress to the next level"

    }
    
    // Calculate table row height based on number of topics
    func calculateRowHeight() -> CGFloat {
        return homeTableView.frame.height / CGFloat(OverlayData.count)
    }

    // Define number of table rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OverlayData.count
    }
    
    // Define table topic cell content
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCellWithIdentifier("Topic Cell") as! TopicCell
        let index = indexPath.row
        let topic = OverlayData[index]

        cell.topicNameLabel.text = topic.name
        cell.mainColor = topic.color
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Dragging home table down to reveal profile page
    @IBAction func didPanHomeTable(sender: UIPanGestureRecognizer) {

        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            originalTableViewOrigin = homeTableView.frame.origin
            originalTableViewSize = homeTableView.frame.size

        } else if sender.state == UIGestureRecognizerState.Changed {
            homeTableView.frame = CGRectMake(
                0,
                originalTableViewOrigin.y + translation.y,
                originalTableViewSize.width,
                originalTableViewSize.height - translation.y)
            
            reloadHomeTable()

        } else if sender.state == UIGestureRecognizerState.Ended {
            if (velocity.y > 0) {
                // Collapse
                animateHomeTableDown()
                toggleCaretDown()
            } else {
                // Open
                animateHomeTableUp()
                toggleCaretUp()
            }
            
            reloadHomeTable()
        }
    }
    
    func toggleCaretDown() {
        UIView.animateWithDuration(0.4, animations: {
            self.caretImageView.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
        })
    }
    
    func toggleCaretUp() {
        UIView.animateWithDuration(0.4, animations: {
            self.caretImageView.transform = CGAffineTransformMakeRotation((0.0 * CGFloat(M_PI)) / 180.0)
        })
    }
    
    // Reload home table to adjust table row height
    func reloadHomeTable() {
        homeTableView.rowHeight = calculateRowHeight()
        homeTableView.reloadData()
    }
    
    func animateHomeTableDown() {
        let collapsedHeight = CGFloat(220)
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
            self.homeTableView.frame.size = CGSize(
                width: self.originalTableViewSize.width,
                height: collapsedHeight)
            self.homeTableView.frame.origin.y = self.view.frame.height - collapsedHeight
            }, completion: { (Bool) -> Void in
        })
    }
    
    func animateHomeTableUp() {
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
            self.homeTableView.frame.size = CGSize(
                width: self.originalTableViewSize.width,
                height: self.homeTableViewHeight)
            self.homeTableView.frame.origin.y =
                self.view.frame.height - self.homeTableViewHeight
            }, completion: { (Bool) -> Void in
        })
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.performSegueWithIdentifier("topicSegue", sender: cell)
        }
    }
    
    @IBAction func firstProgressButtonDidTap(sender: AnyObject) {
        colorProgressView.alpha = 1
        contrastProgressView.alpha = 0
        repetitionProgressView.alpha = 0
        alignmentProgressView.alpha = 0
        proximityProgressView.alpha = 0
        
        globalTitleLabel.text = "Look at you go!"
        globalBodyLabel.text = "One down, only a few more to go. Keep at it!"
        
    }
    
    @IBAction func secondProgressButtonDidTap(sender: AnyObject) {
        colorProgressView.alpha = 1
        contrastProgressView.alpha = 1
        repetitionProgressView.alpha = 1
        alignmentProgressView.alpha = 1
        proximityProgressView.alpha = 1
        
        globalTitleLabel.text = "You are a design master!"
        globalBodyLabel.text = "You've made it to the end. Now what are you going to do about it?"
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! TopicCell
        let topicViewController = segue.destinationViewController as! TopicViewController
        topicViewController.topicIndex = homeTableView.indexPathForCell(cell)!.row
    }
}
