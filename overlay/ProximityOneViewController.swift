//
//  ProximityOneViewController.swift
//  overlay
//
//  Created by Michelle Harvey on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class ProximityOneViewController: UIViewController {

    @IBOutlet weak var zoneOneView: UIView!
    @IBOutlet weak var zoneTwoView: UIView!
    
    // first type of shape
    @IBOutlet weak var unitAOne: UIView!
    @IBOutlet weak var unitATwo: UIView!
    @IBOutlet weak var unitAThree: UIView!
    
    //second type of shape
    @IBOutlet weak var unitBOne: UIView!
    @IBOutlet weak var unitBTwo: UIView!
    @IBOutlet weak var unitBThree: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoneOneView.addInactiveDashedBorder()
        zoneTwoView.addInactiveDashedBorder()
        
        unitAOne.backgroundColor = proximityColor
        unitATwo.backgroundColor = proximityColor
        unitAThree.backgroundColor = proximityColor
        unitBOne.backgroundColor = alignmentColor
        unitBTwo.backgroundColor = alignmentColor
        unitBThree.backgroundColor = alignmentColor
        
        unitAOne.layer.cornerRadius = 30
        unitATwo.layer.cornerRadius = 30
        unitAThree.layer.cornerRadius = 30
        
        unitBOne.layer.cornerRadius = 5
        unitBTwo.layer.cornerRadius = 5
        unitBThree.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
