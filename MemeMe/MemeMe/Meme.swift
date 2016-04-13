//
//  Meme.swift
//  MemeMe
//
//  Created by Alberto Muñoz on 13/4/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    let topText: NSString
    let bottomText: NSString
    
    let originalImage: UIImage
    let memedImage: UIImage
    
    init(topText: NSString, bottomText: NSString, image: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = image
        self.memedImage = memedImage
    }
}