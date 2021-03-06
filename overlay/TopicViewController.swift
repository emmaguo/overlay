//
//  TopicViewController.swift
//  overlay
//
//  Created by Emma Guo on 3/14/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class TopicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var topicHeaderView: UIView!
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var topicDescriptionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!

    var originalScrollViewOrigin: CGPoint!
    var topicIndex: Int!
    var topic: Topic!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topic = OverlayData[topicIndex]
        topicHeaderView.backgroundColor = topic.color
        topicNameLabel.text = topic.name
        topicNameLabel.font = headerFontTwo
        topicDescriptionLabel.text = topic.description
        tableView.delegate = self
        tableView.dataSource = self
        
        topicHeaderView.alpha = 0
        topicHeaderView.center.y = -10
        tableView.alpha = 0
        tableView.center.y = -10
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animateWithDuration(0.4, delay: 0.4, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
            self.topicHeaderView.alpha = 1
            self.topicHeaderView.center.y = 80
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
                    self.tableView.alpha = 1
                    self.tableView.center.y = 420
                }, completion: { (Bool) -> Void in
                        
            })
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // Define number of table rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topic.subjects.count
    }
    
    // Define table topic cell content
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Subject Cell") as! SubjectCell
        let index = indexPath.row
        let subject = topic.subjects[index]
        cell.name.text = subject.name
        cell.mainColor = topic.color
        cell.durationLabel.text = String(subject.duration) + " mins"
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let subjectStatus = userDefaults.valueForKey("Topic-" + String(topicIndex) + "-Subject-" + String(index))
        
        if subjectStatus == nil {
            cell.status = false
        } else {
            cell.status = subjectStatus as! Bool
        }
        
        if index == 0 {
            cell.topLine.hidden = true
        } else if index == topic.subjects.count - 1 {
            cell.bottomLine.hidden = true
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.performSegueWithIdentifier("lessonSegue", sender: cell)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanScrollView(sender: UIPanGestureRecognizer) {

        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            originalScrollViewOrigin = scrollView.frame.origin
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            scrollView.frame.origin = CGPoint(
                x: 0, y: originalScrollViewOrigin.y + translation.y)
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            if (velocity.y > 0) {
                // Collapse
                self.performSegueWithIdentifier("backHomeSegue", sender: self)
            } else {
                // Open
                scrollView.frame.origin = originalScrollViewOrigin
            }
        }
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "lessonSegue" {
            let cell = sender as! SubjectCell
            let lessonViewController = segue.destinationViewController as! LessonViewController
            lessonViewController.topicIndex = topicIndex
            lessonViewController.subjectIndex = tableView.indexPathForCell(cell)!.row
            lessonViewController.primaryColor = topic.color
        }
    }
}
