//
//  FirstViewController.swift
//  ResumeApp
//
//  Created by user on 2/25/15.
//  Copyright (c) 2015 ZachQuiring. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    let pageTitles = ["eagleOne.jpeg", "eagleTwo.jpeg", "eagleThree.jpeg", "eagleFour.jpeg"]
    var pageIndex : Int = 0
    var owner : StartupViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(pageIndex)
        createView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createView () {
        
//        var label = UILabel(frame: CGRectMake(view.frame.width / 2 - 100, view.frame.height / 2 - 11, 200, 22))
//        label.text = pageTitles[pageIndex]
//        label.textColor = UIColor.redColor()
//        label.textAlignment = NSTextAlignment.Center
//        self.view.addSubview(label)
        
        var eagleImageView = UIImageView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height))
        eagleImageView.image = UIImage(named: pageTitles[pageIndex])
        self.view.addSubview(eagleImageView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}