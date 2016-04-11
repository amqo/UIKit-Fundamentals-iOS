//
//  ViewController.swift
//  Click Counter
//
//  Created by Alberto Muñoz on 11/4/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func decrementCount() {
        if (self.label.text != "0") {
            self.count -= 1
            self.label.text = "\(self.count)"
        }
    }
    
    @IBAction func incrementCount() {
        self.count += 1
        self.label.text = "\(self.count)"
    }
}

