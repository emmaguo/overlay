//
//  LessonViewController.swift
//  overlay
//
//  Created by Sam Huskins on 3/16/16.
//  Copyright © 2016 overlay. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var lessonScrollView: UIScrollView!
    @IBOutlet weak var progressRailView: UIView!
    @IBOutlet weak var progressView: UIView!
    
    var topicIndex: Int!
    var subjectIndex: Int!
    var primaryColor: UIColor!
    var lessonCards: [LessonCard]!
    
    var lessonCount = CGFloat()
    var progressSegment = CGFloat()
    var contentWidth = 333
    var lessonIndex = 0
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lessonCards = OverlayData[topicIndex].subjects[subjectIndex].lessons
        
        lessonScrollView.delegate = self
        lessonCount = CGFloat(lessonCards.count)
        
        // Progress and Bkg color
        progressView.layer.cornerRadius = 3
        progressView.backgroundColor = mediumGray
        progressRailView.layer.cornerRadius = 3
        backgroundView.backgroundColor = primaryColor
        let railLength = progressRailView.frame.size.width
        progressSegment = railLength/(lessonCount)

        //set scroll view dimensions
        let contentWidth = lessonScrollView.bounds.width
        let contentHeight = lessonScrollView.bounds.height
        lessonScrollView.contentSize = CGSizeMake(CGFloat((lessonCount+1)*contentWidth), contentHeight)
        lessonScrollView.pagingEnabled = true
        lessonScrollView.showsHorizontalScrollIndicator = false
        
        // Quiz card
        let quizCard = UIView(frame: CGRectMake((lessonCount)*contentWidth+6, 100, 320, 244))
        quizCard.backgroundColor = white
        quizCard.layer.cornerRadius = 16.0
        quizCard.layer.shadowColor = UIColor.blackColor().CGColor
        quizCard.layer.shadowOpacity = 0.2
        quizCard.layer.shadowOffset = CGSizeZero
        quizCard.layer.shadowRadius = 16
        
        let quizHeader = UILabel(frame: CGRectMake(24, 24, 272, 30))
        quizHeader.text = "Quiz Time!"
        quizHeader.textColor = darkGray
        quizHeader.font = headerFontThree
        quizHeader.textAlignment = NSTextAlignment.Center
        quizHeader.contentMode = UIViewContentMode.ScaleAspectFit
        
        let quizBody = UILabel(frame: CGRectMake(24, 66, 272, 400))
        quizBody.text = "Let’s put this lesson’s concepts into practice!"
        quizBody.textColor = darkGray
        quizBody.font = bodyFontOne
        quizBody.textAlignment = NSTextAlignment.Center
        quizBody.lineBreakMode = NSLineBreakMode.ByWordWrapping
        quizBody.numberOfLines = 2
        quizBody.contentMode = UIViewContentMode.ScaleAspectFit
        quizBody.sizeToFit()
        
        let quizButton = UIButton (frame: CGRectMake(24, 160, 269, 60))
        quizButton.backgroundColor = primaryColor
        quizButton.layer.cornerRadius = 4.0
        quizButton.setTitle("Take Quiz", forState: .Normal)
        quizButton.titleLabel!.font = headerFontThree
        quizButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)

        quizCard.addSubview(quizHeader)
        quizCard.addSubview(quizBody)
        quizCard.addSubview(quizButton)

        lessonScrollView.addSubview(quizCard)

        for lessonCard in lessonCards {
            
            // Create cards
            let card = UIView(frame: CGRectMake(CGFloat(lessonIndex)*contentWidth+6, 0, 320, 480))
            card.backgroundColor = white
            card.layer.cornerRadius = 16.0
            card.layer.shadowColor = UIColor.blackColor().CGColor
            card.layer.shadowOpacity = 0.2
            card.layer.shadowOffset = CGSizeZero
            card.layer.shadowRadius = 16
            
            // Create content on 1 card
            let headerLabel = UILabel(frame: CGRectMake(24, 24, 300, 30))
            headerLabel.text = lessonCard.title
            headerLabel.textColor = darkGray
            headerLabel.font = headerFontThree
            headerLabel.textAlignment = NSTextAlignment.Left
            headerLabel.contentMode = UIViewContentMode.ScaleAspectFit
            
            let bodyLabel = UILabel(frame: CGRectMake(24, 66, 272, 400))
            bodyLabel.text = lessonCard.body
            bodyLabel.textColor = darkGray
            bodyLabel.font = bodyFontOne
            bodyLabel.textAlignment = NSTextAlignment.Left
            bodyLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            bodyLabel.numberOfLines = 0
            bodyLabel.contentMode = UIViewContentMode.ScaleAspectFit
            bodyLabel.sizeToFit()
            card.addSubview(headerLabel)
            card.addSubview(bodyLabel)
            
            let bodyHeight = bodyLabel.bounds.height
            var imageView : UIImageView
            imageView  = UIImageView(frame:CGRectMake(45, CGFloat(bodyHeight)+75, 225, 225));
            imageView.image = lessonCard.image
            card.addSubview(imageView)
            
            lessonScrollView.addSubview(card)

            if lessonIndex < Int(lessonCount) {
                lessonIndex++
            }
        }
        
        backgroundView.alpha = 0
        
        lessonScrollView.alpha = 0
        progressRailView.alpha = 0
        progressView.alpha = 0
        
        lessonScrollView.center.x = 520
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
            self.backgroundView.alpha = 1
            }) { (Bool) -> Void in
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
                    self.progressRailView.alpha = 1
                    self.progressView.alpha = 1
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 5.0, initialSpringVelocity: 1.0, options: [], animations: { () -> Void in
                            self.lessonScrollView.center.x = 187.5
                            self.lessonScrollView.alpha = 1
                            }, completion: { (Bool) -> Void in
                                
                        })
                    })
                
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickingClose(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : CGFloat = CGFloat(lessonScrollView.contentOffset.x / CGFloat(contentWidth))
        progressView.frame.origin.x = -270 + (progressSegment*page+1)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        var page : Int = Int(round(lessonScrollView.contentOffset.x / 333))
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let quizViewController = segue.destinationViewController as! QuizViewController
        quizViewController.topicIndex = topicIndex
        quizViewController.subjectIndex = subjectIndex
        quizViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        fadeTransition = FadeTransition()
        quizViewController.transitioningDelegate = fadeTransition
        fadeTransition.duration = 1.0
    }
    
    func buttonAction(sender:UIButton!) {
        performSegueWithIdentifier("quizSegue", sender: self)
    }
}
