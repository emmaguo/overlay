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
        topicDescriptionLabel.text = topic.description
        tableView.delegate = self
        tableView.dataSource = self
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
        return cell
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
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                // Open
                scrollView.frame.origin = originalScrollViewOrigin
            }
        }
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
