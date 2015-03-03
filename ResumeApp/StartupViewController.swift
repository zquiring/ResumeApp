//
//  StartupViewController.swift
//  ResumeApp
//
//  Created by user on 2/26/15.
//  Copyright (c) 2015 ZachQuiring. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController, UIPageViewControllerDataSource{
    
    var tutorialPageViewController : UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreatePageViewController()
        //CreateView()
    }
    
//    @IBAction func swipeLeft(sender: AnyObject) {
//        println("SWipe left")
//    }
//    @IBAction func swiped(sender: AnyObject) {
//        self.tutorialPageViewController?.view .removeFromSuperview()
//        self.tutorialPageViewController?.removeFromParentViewController()
//    }
    
    func CreatePageViewController () {
        view.backgroundColor = UIColor.blueColor()
        var firstPageController : TutorialViewController = TutorialViewController ()
        
        firstPageController  = self.storyboard?.instantiateViewControllerWithIdentifier("TutorialViewControllerID") as TutorialViewController
        
        firstPageController.pageIndex = 0
        firstPageController.owner = self
        
        self.tutorialPageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: .None)
        self.tutorialPageViewController.dataSource = self
        self.tutorialPageViewController?.setViewControllers([firstPageController], direction: .Forward, animated: false, completion: nil)
        self.tutorialPageViewController.view.frame = self.view.bounds
        self.addChildViewController(self.tutorialPageViewController!)
        self.view.addSubview(tutorialPageViewController.view)
        self.tutorialPageViewController?.didMoveToParentViewController(self)
    }
    
//    func reset() {
//        /* Getting the page View controller */
//        pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TutorialPageViewController") as? UIPageViewController
//        self.pageViewController?.dataSource = self
//        
//        let pageContentViewController = self.viewControllerAtIndex(0)
//        self.pageViewController?.setViewControllers([pageContentViewController!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
//        
//        
//        /* We are substracting 30 because we have a start again button whose height is 30*/
//        self.pageViewController?.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height - 50)
//        self.addChildViewController(pageViewController!)
//        self.view.addSubview(pageViewController.view)
//        self.pageViewController?.didMoveToParentViewController(self)
//    }
    
    func CreateView () {
        var segueButton = UIButton(frame: CGRectMake(view.frame.width / 2 - 150, view.frame.height / 2 - 40, 300, 80))
        segueButton.backgroundColor = UIColor.redColor()
        segueButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        segueButton.setTitle("Segue To First VC", forState: UIControlState.Normal)
        segueButton.addTarget(self, action: "SegueButtonClicked:", forControlEvents: .TouchUpInside)
        view.addSubview(segueButton)
    }
    
//    private func setupPageControl() {
//        let appearance = UIPageControl.appearance()
//        appearance.pageIndicatorTintColor = UIColor.grayColor()
//        appearance.currentPageIndicatorTintColor = UIColor.whiteColor()
//        appearance.backgroundColor = UIColor.darkGrayColor()
//    }
    
    func SegueButtonClicked (sender: UIButton!) {
        performSegueWithIdentifier("SegueToTabBar", sender: self)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var currentViewController = viewController as TutorialViewController
        
        if(currentViewController.pageIndex >= 3){
            return nil
        } else {
            var newPageIndex = currentViewController.pageIndex + 1
            var newPage : TutorialViewController = TutorialViewController()
            newPage.pageIndex = newPageIndex
            newPage.owner = self
            return newPage
        }
    }
    
    //Get Previous View Controller
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var currentViewController = viewController as TutorialViewController
        
        if(currentViewController.pageIndex <= 0){
            return nil
        } else {
            var newPageIndex = currentViewController.pageIndex - 1
            var newPage : TutorialViewController = TutorialViewController()
            newPage.pageIndex = newPageIndex
            newPage.owner = self
            return newPage
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    class PageDataSource : NSObject, UIPageViewControllerDataSource {
        
        var parentController : StartupViewController!
        
        init (parentController : StartupViewController) {
            self.parentController = parentController
        }
        
        //Get Next View Controller
        func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            
            var currentViewController = viewController as TutorialViewController
            
            if(currentViewController.pageIndex >= 3){
                return nil
            } else {
                var newPageIndex = currentViewController.pageIndex + 1
                var newPage : TutorialViewController = TutorialViewController()
                newPage.pageIndex = newPageIndex
                newPage.owner = self.parentController
                return newPage
            }
        }
        
        //Get Previous View Controller
        func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            
            var currentViewController = viewController as TutorialViewController
            
            if(currentViewController.pageIndex <= 0){
                return nil
            } else {
                var newPageIndex = currentViewController.pageIndex - 1
                var newPage : TutorialViewController = TutorialViewController()
                newPage.pageIndex = newPageIndex
                newPage.owner = self.parentController
                return newPage
            }
        }
        
        func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
            return 4
        }
        
        func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
            return 0
        }
    }
    
}
