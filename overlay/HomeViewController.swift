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
    
    let topicsColors = [
        UIColor(hexString: "#9F8BFF"),
        UIColor(hexString: "#65D3EF"),
        UIColor(hexString: "#B6DE85"),
        UIColor(hexString: "#FFD57E"),
        UIColor(hexString: "#FF9E7C")
    ]
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.rowHeight = 120
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
