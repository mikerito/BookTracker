//
//  GameViewController.swift
//  BookTracker
//
//  Created by Mike Rito on 9/17/17.
//  Copyright © 2017 Mike Rito. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    var book : Book? = nil
    
    //////////////////////////// ////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
    //////////////////////////// ////////////////////////////
    
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if book != nil {
            book!.title = titleTextField.text
            book!.image = UIImagePNGRepresentation(gameImageView.image! as ?NSData)
            
        } else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let book = Book(context: context)
            book.title = titleTextField.text
            book.image = (UIImagePNGRepresentation(gameImageView.image!)! as NSData)
            
        }
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
