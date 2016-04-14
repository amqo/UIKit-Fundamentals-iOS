//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Alberto Muñoz on 14/4/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let screenSize = UIScreen.mainScreen().bounds
//        let screenWidth = screenSize.width
//        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: screenWidth / 4, height: screenWidth / 4)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        self.memes =  (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        self.collectionView!.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = self.memes[indexPath.row]
        
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let addNewMemeController = self.storyboard!.instantiateViewControllerWithIdentifier("addMemeController") as! ViewController
        addNewMemeController.meme = self.memes[indexPath.row]
        
        self.navigationController?.pushViewController(addNewMemeController, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSizeMake(picDimension, picDimension);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
}