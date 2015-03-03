//
//  FirstViewController.swift
//  ResumeApp
//
//  Created by user on 2/25/15.
//  Copyright (c) 2015 ZachQuiring. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    private var pageViewController: UIPageViewController!
    
    var images = ["long3.png","long4.png","long1.png","long2.png"]
    var count = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        setupPageControl()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func swipeLeft(sender: AnyObject) {
        println("SWipe left")
    }
    @IBAction func swiped(sender: AnyObject) {
        self.pageViewController?.view .removeFromSuperview()
        self.pageViewController?.removeFromParentViewController()
        reset()
    }
    
    func reset() {
        /* Getting the page View controller */
        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TutorialPageViewController") as? UIPageViewController
        self.pageViewController?.dataSource = self
        
        let pageContentViewController = self.viewControllerAtIndex(0)
        self.pageViewController?.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)

        
        /* We are substracting 30 because we have a start again button whose height is 30*/
        self.pageViewController?.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 50)
        self.addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController.view)
        self.pageViewController?.didMoveToParentViewController(self)
    }
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.grayColor()
        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
        appearance.backgroundColor = UIColor.darkGrayColor()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as TutorialViewController).pageIndex
        index++
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as TutorialViewController).pageIndex
            index--
        return self.viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index : Int) -> UIViewController? {
        if((index >= 4 || index == -1)) {
            return nil
        }
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TutorialViewControllerID") as TutorialViewController
        
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

