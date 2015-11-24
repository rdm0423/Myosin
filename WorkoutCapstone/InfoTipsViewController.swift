//
//  InfoTipsViewController.swift
//  WorkoutCapstone
//
//  Created by Ross McIlwaine on 11/23/15.
//  Copyright © 2015 Ross McIlwaine. All rights reserved.
//

import Foundation
import UIKit

class InfoTipsViewController: UIViewController {
    
    var counter = 1
    var maxImages = 5
    
    @IBOutlet weak var tipImage: UIImageView!
    
    
    @IBAction func nextButton(sender: AnyObject) {
        
        // check the number of images in array
        if counter == 5 {
            
            counter = 1
            
        } else {
            
            counter++
        }
        // Make sure image naems are all the same for this to work effectively
        tipImage.image = UIImage(named: "Screenshot \(counter).jpg")
        
    }
    
    @IBAction func previousButton(sender: AnyObject) {
        
        // need to know where it is in array and then move backward to image 0
        if counter == 5 {
            
            counter = 1
            
        } else {
            
            if counter != 1 {
                counter--
            }
        }
        
        tipImage.image = UIImage(named: "Screenshot \(counter).jpg")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipImage.image = UIImage(named: "Screenshot 1")
        
        self.title = "App Overview"
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:") // put : at the end of method name
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:") // put : at the end of method name
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        tipImage.image = UIImage(named:"Screenshot \(counter).jpg")
        
    }
    
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Right :
                
                if counter == 5 {
                    
                    counter = 1
                    
                } else {
                    
                    if counter != 1 {
                        counter--
                    }
                }
                
                tipImage.image = UIImage(named: "Screenshot \(counter).jpg")
                
            case UISwipeGestureRecognizerDirection.Left:
                
                if counter == 5 {
                    
                    counter = 1
                    
                } else {
                    
                    counter++
                }
                
                tipImage.image = UIImage(named: "Screenshot \(counter).jpg")
                
            default:
                break //stops the code/codes nothing.
                
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
