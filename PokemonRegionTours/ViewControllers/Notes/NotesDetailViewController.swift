//
//  NotesDetailViewController.swift
//  PokemonRegionTours
//
//  Created by Tony Calarese on 4/1/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    var notes: Notes? = nil
    
    //source of image picker: https://stackoverflow.com/questions/25510081/how-to-allow-user-to-pick-the-image-with-swift
    var imageString: String = "Eevee"
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var ImageButton: UIButton!
    @IBOutlet weak var NoteTitle: UITextField!
    @IBOutlet weak var NotesImage: UIImageView!
    @IBOutlet weak var BodyText: UITextView!
    
    @IBAction func UpdateNotesTitle(_ sender: UITextField) {
        if let title = sender.text {
            notes?.name = title
        }
        else{
            sender.text = "New Note"
        }
    }
    /* begin of source for image picker */
    @IBAction func uploadImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                   print("Button capture")

                   imagePicker.delegate = self
                   imagePicker.sourceType = .savedPhotosAlbum
                   imagePicker.allowsEditing = false

                   present(imagePicker, animated: true, completion: nil)
               }
        
        func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
            self.dismiss(animated: true, completion: { () -> Void in

            })

            NotesImage.image = image
        }
        
    }
    // of image picker source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the Default data
        if let userNotes = notes{
            NoteTitle.text = userNotes.name
            if let img = userNotes.image {
                NotesImage.image = UIImage(named: img)
            }
        
            BodyText.text = userNotes.desc
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let body = BodyText.text {
            notes?.desc = body
        }
        if let image = NotesImage.image {
      //      UIImage(contentsOfFile: String)
      //      notes?.image = image
        }
    }


}
