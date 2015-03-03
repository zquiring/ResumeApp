//
//  UsersListViewController.swift
//  ResumeApp
//
//  Created by user on 3/2/15.
//  Copyright (c) 2015 ZachQuiring. All rights reserved.
//

import UIKit
import Parse

class UsersListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let UserCellReuseIdentifier = "UserCell"
    var users : [PFObject]!
    
    override func viewDidLoad() {
        SetUsers ()
        //CreateView()
        super.viewDidLoad();
    }
    
    func SetUsers () {
        var queryAllUsers = PFQuery(className: "Users")
        queryAllUsers.orderByAscending("Name")
        queryAllUsers.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                self.users = objects as [PFObject]
                self.CreateView()
            } else {
                println("Error find users.")
            }
        }
        
//        var queryAllUsersTwo = PFQuery(className: "Users")
//        queryAllUsersTwo.orderByAscending("Name")
//        self.users = queryAllUsersTwo.findObjects() as [PFObject]
        
    }
    
    func CreateView () {
        
        view.backgroundColor = A.Resume_Light_Gray;
        
        var yOffset : CGFloat = 40;
        
        var selectProfileLabel = UILabel(frame: CGRectMake(50, yOffset, view.frame.width - 100, 50))
        selectProfileLabel.font = A.Avenir_Medium_24
        selectProfileLabel.textAlignment = NSTextAlignment.Center;
        selectProfileLabel.textColor = UIColor.blackColor();
        selectProfileLabel.text = "Select Your Profile"
        view.addSubview(selectProfileLabel)
        
        yOffset = selectProfileLabel.frame.maxY + 20
        
        var honorSystemLabel = UILabel(frame: CGRectMake(50, yOffset, view.frame.width - 100, 50))
        honorSystemLabel.font = A.Avenir_Medium_12
        honorSystemLabel.textAlignment = NSTextAlignment.Center;
        honorSystemLabel.textColor = A.Resume_Light_Blue;
        honorSystemLabel.numberOfLines = 2;
        honorSystemLabel.text = "This application relies on the Honors System. Please Respect that."
        view.addSubview(honorSystemLabel)
        
        yOffset = honorSystemLabel.frame.maxY + 30;
        
        var usersTableView = UITableView(frame: CGRectMake(0, yOffset, view.frame.width, view.frame.maxY - yOffset))
        usersTableView.dataSource = self
        usersTableView.delegate = self
        view.addSubview(usersTableView)
    }
    
    func configureCell (cell:UITableViewCell, user: PFObject) {
        let userInfo = user as PFObject
        
        var profilePhotoImageView = cell.viewWithTag(99) as? UIImageView
        profilePhotoImageView?.image = UIImage(named: getProfilePhoto())
        
        var nameLabel = cell.viewWithTag(100) as? UILabel
        nameLabel?.text = user["Name"] as? String
        
        var companyAndPositionLabel = cell.viewWithTag(101) as? UILabel
        companyAndPositionLabel?.text = (user["Position"] as? String)! + ", " + (user["Company"] as? String)!
    }
    
    func createCell (tableView: UITableView) -> UITableViewCell {
        
        var cell = UITableViewCell(style: .Subtitle, reuseIdentifier: UserCellReuseIdentifier)
        cell.indentationWidth = 50
        
        var profilePhotoImageView = UIImageView(frame: CGRectMake(15, 12.5, 40, 40))
        profilePhotoImageView.layer.cornerRadius = 20;
        profilePhotoImageView.layer.masksToBounds = true
        profilePhotoImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        profilePhotoImageView.layer.borderWidth = 0.5
        profilePhotoImageView.tag = 99
        cell.addSubview(profilePhotoImageView)
        
        var nameLabel = UILabel(frame: CGRectMake(70, 15, 200, 20))
        nameLabel.font = A.Avenir_Medium_18
        nameLabel.tag = 100
        cell.addSubview(nameLabel)
        
        var companyAndPositionLabel = UILabel(frame: CGRectMake(70, 35, 200, 20))
        companyAndPositionLabel.font = A.Avenir_Medium_14
        companyAndPositionLabel.tag = 101
        companyAndPositionLabel.textColor = UIColor.lightGrayColor()
        cell.addSubview(companyAndPositionLabel)
        
        return cell
    }
    
    func getProfilePhoto () -> String {
        let randomNumber : Int = 1 + Int(arc4random_uniform(8))
        var profilePhotoString = "Face"
        switch (randomNumber) {
        case 1 :
            profilePhotoString += "One"
            break
        case 2 :
            profilePhotoString += "Two"
            break
        case 3 :
            profilePhotoString += "Six"
            break
        case 4 :
            profilePhotoString += "Seven"
            break
        case 5 :
            profilePhotoString += "Nine"
            break
        case 6 :
            profilePhotoString += "Ten"
            break
        case 7 :
            profilePhotoString += "Eleven"
            break
        case 8 :
            profilePhotoString += "Twelve"
            break
        default:
            profilePhotoString += "One"
            break

        }
        println(profilePhotoString)
        return profilePhotoString
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(UserCellReuseIdentifier) as? UITableViewCell
        if (nil == cell) {
            cell = createCell(tableView)
        }
        
        configureCell(cell!, user: users[indexPath.row] as PFObject)
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 65
    }

}
