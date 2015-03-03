//
//  UIHelpers.swift
//  ResumeApp
//
//  Created by user on 3/2/15.
//  Copyright (c) 2015 ZachQuiring. All rights reserved.
//

import UIKit

struct UIHelpers {
    
    static let Avenir_Medium_18 : UIFont = UIFont(name: "Avenir Medium", size: 18)!
    
    static func HorizontalLine (yOffset: CGFloat, xOffset: CGFloat, width: CGFloat, thickness: CGFloat, color: UIColor) -> UIView {
        var line : UIView = UIView(frame: CGRectMake(xOffset, yOffset, width, thickness));
        line.backgroundColor = color;
        return line;
    }
}