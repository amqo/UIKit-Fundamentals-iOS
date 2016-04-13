//
//  VillianDetailViewController.swift
//  BondVillains
//
//  Created by Alberto Muñoz on 13/4/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class VillianDetailViewController: UIViewController {
    
    var villain: Villain?
    
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainText: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.villainImage.image = UIImage(named: villain!.imageName)
        self.villainText.text = villain!.name
    }
    
}