//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Alberto Muñoz on 12/4/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let colors : [UIColor] = [
        UIColor.redColor(),
        UIColor.orangeColor(),
        UIColor.yellowColor(),
        UIColor.greenColor(),
        UIColor.blueColor(),
        UIColor.brownColor(),
        UIColor.blackColor(),
        UIColor.purpleColor(),
        UIColor.cyanColor(),
        UIColor.magentaColor()
    ]
    
    func randomColor() -> UIColor {
        let colorIndex:Int! = Int(arc4random_uniform(UInt32(colors.count)))
        return colors[colorIndex]
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        return true;
    }
    
}
