//
//  Data.swift
//  overlay
//
//  Created by Emma Guo on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit
import SwiftHEXColors

// ------ Colors ------

let lightestGray = UIColor(hexString: "#f9f9f9")
let lightGray = UIColor(hexString: "#eff0f1")
let mediumGray = UIColor(hexString: "#959ca8")
let darkGray = UIColor(hexString: "#2e3b54")

let red = UIColor(hexString: "#f44336")
let green = UIColor(hexString: "#4caf50")

let proximityColor = UIColor(hexString: "#3CF7D1")
let alignmentColor = UIColor(hexString: "#01CEFF")
let repetitionColor = UIColor(hexString: "#A177FF")
let contrastColor = UIColor(hexString: "#FFD201")
let colorColor = UIColor(hexString: "#FF6D92")

// main color usage

let topicsColors = [
    proximityColor,
    alignmentColor,
    repetitionColor,
    contrastColor,
    colorColor
]

let mainBackgroundColor = darkGray
let homeTableBackgroundColor = topicsColors[4]

// interactive quiz colors

let zoneBackgroundColor = lightestGray
let outlineInactive = mediumGray
let outlineActive = darkGray

// quiz global colors

let buttonInactive = lightGray
let buttonActive = darkGray
let buttonError = red
let buttonSuccess = green


// ------ Topics ------
let topicsNames = [
    "Proximity",
    "Alignment",
    "Repetition",
    "Contrast",
    "Colors"
]