//
//  ViewController.swift
//  MYOA
//
//  Created by Alberto Muñoz on 13/4/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (
            title: "Start Over",
            style: UIBarButtonItemStyle.Plain,
            target: self, action: #selector(ViewController.startOver))
    }

    func startOver() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
}

