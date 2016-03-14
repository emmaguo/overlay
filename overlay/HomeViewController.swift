//
//  HomeViewController.swift
//  overlay
//
//  Created by Emma Guo on 3/13/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit
import SwiftHEXColors

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    let mainBackgroundColor: UIColor! = UIColor(hexString: "#F58072")
    var originalTableViewOrigin: CGPoint!
    var originalTableViewSize: CGSize!
    let topicsColors = [
        UIColor(hexString: "#9F8BFF"),
        UIColor(hexString: "#65D3EF"),
        UIColor(hexString: "#B6DE85"),
        UIColor(hexString: "#FFD57E"),
        UIColor(hexString: "#FF9E7C")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = mainBackgroundColor
        
        homeTableView.backgroundColor = mainBackgroundColor
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.rowHeight = calculateRowHeight()
    }
    
    // Calculate table row height based on number of topics
    func calculateRowHeight() -> CGFloat {
        return homeTableView.frame.height / CGFloat(topicsColors.count)
    }

    // Define number of table rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topicsColors.count
    }
    
    // Define table topic cell content
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCellWithIdentifier("Topic Cell") as! TopicCell
        let index = indexPath.row
        cell.topicNameLabel.text = "Topic \(index)"
        cell.backgroundColor = topicsColors[index]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Dragging home table down to reveal profile page
    @IBAction func didPanHomeTable(sender: UIPanGestureRecognizer) {

        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            originalTableViewOrigin = homeTableView.frame.origin
            originalTableViewSize = homeTableView.frame.size

        } else if sender.state == UIGestureRecognizerState.Changed {
            homeTableView.frame = CGRectMake(
                0,
                originalTableViewOrigin.y + translation.y,
                originalTableViewSize.width,
                originalTableViewSize.height - translation.y)
            
            homeTableView.rowHeight = calculateRowHeight()
            homeTableView.reloadData()

        } else if sender.state == UIGestureRecognizerState.Ended {
            homeTableView.frame.origin = originalTableViewOrigin
            homeTableView.frame.size = originalTableViewSize
            homeTableView.rowHeight = calculateRowHeight()
            homeTableView.reloadData()
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
