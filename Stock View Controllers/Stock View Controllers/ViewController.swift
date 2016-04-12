//
//  ViewController.swift
//  Stock View Controllers
//
//  Created by Alberto Muñoz on 12/4/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func experiment() {
        let nextController = UIImagePickerController()
        
        self.presentViewController(nextController, animated: true, completion: nil)
    }
 
    @IBAction func alertView(sender: UIButton) {
        let controller = UIAlertController()
        controller.title = "Test alert"
        controller.message = "This is an Alert Controller"
        
        let doneAction = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: {
            action in self.dismissViewControllerAnimated(true, completion: nil)
        })
        
        controller.addAction(doneAction)
        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func activityView(sender: UIButton) {
        let image = UIImage()
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        self.presentViewController(nextController, animated: true, completion: nil)
    }
}

