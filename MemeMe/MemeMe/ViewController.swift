//
//  ViewController.swift
//  MemeMe
//
//  Created by Alberto Muñoz on 13/4/16.
//  Copyright © 2016 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var toolBar: UIToolbar!
    
    var meme: Meme!
    
    let TOP = "TOP"
    let BOTTOM = "BOTTOM"
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -1.0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shareButton.enabled = false
        
        topTextField.text = TOP
        topTextField.delegate = self
        topTextField.defaultTextAttributes = memeTextAttributes
        topTextField.textAlignment = NSTextAlignment.Center
        
        bottomTextField.text = BOTTOM
        bottomTextField.delegate = self
        bottomTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.textAlignment = NSTextAlignment.Center
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.subscribeToKeyboardNotifications()
        
        self.cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeFromKeyboardNotifications()
    }
    
    @IBAction func shareMeme(sender: AnyObject) {
        createMeme()
        let image = self.meme.memedImage
        let nextController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        nextController.completionWithItemsHandler = {
            (activity, success, items, error) in
                self.save()
        }
        self.presentViewController(nextController, animated: true, completion: nil)
    }
    
    func createMeme() {
        let memedImage: UIImage! = generateMemedImage()
        self.meme = Meme(topText: self.topTextField.text!, bottomText: self.bottomTextField.text!,
                        image: self.imagePickerView.image!, memedImage: memedImage)
    }
    
    func save() {
        (UIApplication.sharedApplication().delegate as!
            AppDelegate).memes.append(self.meme)
    }
    
    func generateMemedImage() -> UIImage {
        
        self.navigationBar.hidden = true
        self.toolBar.hidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.navigationBar.hidden = false
        self.toolBar.hidden = false
        
        return memedImage
    }

    @IBAction func pickImageFromAlbum(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        let center = NSNotificationCenter.defaultCenter()
        center.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        center.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func subscribeToKeyboardNotifications() {
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if (self.view.frame.origin.y > 0.0) {
            self.view.frame.origin.y = 0.0
        }
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo!
        let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    @IBAction func pickImageFromCamera(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
            self.shareButton.enabled = true
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField.text == TOP || textField.text == BOTTOM) {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (self.view.frame.origin.y != 0.0) {
            self.view.frame.origin.y = 0.0
        }
        return true
    }

}

