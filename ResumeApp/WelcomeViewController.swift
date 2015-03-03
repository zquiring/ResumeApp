//
//  WelcomeViewController.swift
//  ResumeApp
//
//  Created by user on 3/2/15.
//  Copyright (c) 2015 ZachQuiring. All rights reserved.
//

import UIKit
import Parse

class WelcomeViewController: UIViewController, UITextFieldDelegate {
    
    private var nameTextField : UITextField!
    private var emailTextField : UITextField!
    private var positionTextField : UITextField!
    
    private let NAME_TEXT_FIELD_TAG = 100;
    private let EMAIL_TEXT_FIELD_TAG = 101;
    private let POSITION_TEXT_FIELD_TAG = 102;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        CreateView();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    func CreateView () {
        var yOffset : CGFloat = 25;
        
        var welcomeLabel : UILabel = UILabel(frame: CGRectMake(view.frame.width / 2 - 75, yOffset, 150, 40));
        welcomeLabel.font = A.Avenir_Medium_24;
        welcomeLabel.textAlignment = NSTextAlignment.Center;
        welcomeLabel.textColor = UIColor.darkGrayColor();
        welcomeLabel.text = "Welcome.";
        view.addSubview(welcomeLabel);
        
        yOffset = welcomeLabel.frame.maxY + 50;
        
        var tellUsLabel = UILabel(frame: CGRectMake(50, yOffset, view.frame.width - 100, 60));
        tellUsLabel.font = A.Avenir_Medium_16;
        tellUsLabel.textAlignment = NSTextAlignment.Center;
        tellUsLabel.textColor = UIColor.darkGrayColor();
        tellUsLabel.text = "Please tell us a little bit about yourself.";
        tellUsLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        tellUsLabel.numberOfLines = 2;
        view.addSubview(tellUsLabel);
        
        yOffset = tellUsLabel.frame.maxY + 100;
        
        nameTextField = UITextField(frame: CGRectMake(50, yOffset, view.frame.width - 100, 30));
        nameTextField.font = A.Avenir_Medium_16;
        nameTextField.textColor = UIColor.darkGrayColor();
        nameTextField.textAlignment = NSTextAlignment.Left;
        nameTextField.placeholder = "NAME";
        nameTextField.tag = NAME_TEXT_FIELD_TAG;
        nameTextField.delegate = self;
        view.addSubview(nameTextField);
        
        yOffset = nameTextField.frame.maxY + 5;
        
        var nameBottomLine : UIView = UIHelpers.HorizontalLine(yOffset, xOffset: 50, width: view.frame.width - 100, thickness: 2, color: UIColor.lightGrayColor());
        view.addSubview(nameBottomLine);
        
        yOffset = nameBottomLine.frame.maxY + 50;
        
        emailTextField = UITextField(frame: CGRectMake(50, yOffset, view.frame.width - 100, 30));
        emailTextField.font = A.Avenir_Medium_16;
        emailTextField.textColor = UIColor.darkGrayColor();
        emailTextField.textAlignment = NSTextAlignment.Left;
        emailTextField.placeholder = "COMPANY";
        emailTextField.tag = EMAIL_TEXT_FIELD_TAG;
        emailTextField.delegate = self;
        view.addSubview(emailTextField);
        
        yOffset = emailTextField.frame.maxY + 5;
        
        var emailBottomLine : UIView = UIHelpers.HorizontalLine(yOffset, xOffset: 50, width: view.frame.width - 100, thickness: 2, color: UIColor.lightGrayColor());
        view.addSubview(emailBottomLine);
        
        yOffset = emailBottomLine.frame.maxY + 50;
        
        positionTextField = UITextField(frame: CGRectMake(50, yOffset, view.frame.width - 100, 30));
        positionTextField.font = A.Avenir_Medium_16;
        positionTextField.textColor = UIColor.darkGrayColor();
        positionTextField.textAlignment = NSTextAlignment.Left;
        positionTextField.placeholder = "POSITION";
        positionTextField.tag = POSITION_TEXT_FIELD_TAG;
        positionTextField.delegate = self;
        view.addSubview(positionTextField);
        
        yOffset = positionTextField.frame.maxY + 5;
        
        var positionBottomLine : UIView = UIHelpers.HorizontalLine(yOffset, xOffset: 50, width: view.frame.width - 100, thickness: 2, color: UIColor.lightGrayColor());
        view.addSubview(positionBottomLine);
        
//        yOffset = positionBottomLine.frame.maxY + 30;
//        
//        var takeProfilePicImageView = UIImageView(frame: CGRectMake(50, yOffset, 50, 50));
//        takeProfilePicImageView.image = UIImage(named: "TakeProfilePic");
//        self.view.addSubview(takeProfilePicImageView);
        
        var alreadyHaveProfileButton = UIButton(frame: CGRectMake(50, view.frame.maxY - 100, view.frame.width - 100, 30))
        alreadyHaveProfileButton.backgroundColor = UIColor.whiteColor()
        alreadyHaveProfileButton.setTitle("I already have a profile", forState: .Normal)
        alreadyHaveProfileButton.setTitleColor(A.Resume_Light_Blue, forState: .Normal)
        alreadyHaveProfileButton.titleLabel?.font = A.Avenir_Medium_12
        alreadyHaveProfileButton.addTarget(self, action: "AlreadyHaveProfileButtonClicked:", forControlEvents: .TouchUpInside)
        view.addSubview(alreadyHaveProfileButton)
        
        var continueButton : UIButton = UIButton(frame: CGRectMake(0, view.frame.maxY - 60, view.frame.width, 60));
        continueButton.backgroundColor = A.Resume_Light_Blue;
        //continueButton.setTitle("->", forState: UIControlState.Normal);
        continueButton.setImage(UIImage(named: "ContinueArrowWhite"), forState: .Normal);
        continueButton.addTarget(self, action: "ContinueButtonClicked:", forControlEvents: .TouchUpInside)
        view.addSubview(continueButton);
    }
    
    func AlreadyHaveProfileButtonClicked (sender: UIButton!) {
        
        performSegueWithIdentifier("SegueToUsersListView", sender: self)
    }
    
    func ContinueButtonClicked (sender: UIButton!) {
        
        var newUser = PFObject(className: "Users");
        newUser["Name"] = nameTextField.text
        newUser["Company"] = emailTextField.text
        newUser["Position"] = positionTextField.text
        newUser.saveInBackgroundWithBlock(nil);
        
        performSegueWithIdentifier("SegueToStartup", sender: self)
    }
    
    func textFieldShouldReturn (textField: UITextField!) -> Bool {
        switch(textField.tag){
        case NAME_TEXT_FIELD_TAG:
            emailTextField.becomeFirstResponder();
            break;
        case EMAIL_TEXT_FIELD_TAG:
            positionTextField.becomeFirstResponder();
            break;
        case POSITION_TEXT_FIELD_TAG:
            view.endEditing(true);
            break;
        default:
            break;
        }
        return true;
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

}
