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
    var fave: Bool = false
    
    //source of image picker: https://stackoverflow.com/questions/25510081/how-to-allow-user-to-pick-the-image-with-swift
    var imageString: String = "Eevee"
    var imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var FavoriteButton: UIButton!
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
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("Image got")
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                return
            }
        guard let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL else {
                return
            }
        notes?.image = imageURL.path
        NotesImage.image = image
        picker.dismiss(animated: true) {
            
        }
        
    }
    // of image picker source
   
    
    @IBAction func FavoritePage(_ sender: UIButton) {
        notes?.favorite = !(notes?.favorite ?? false) //default to false just in case
        favoriteItem()
    }
    
    
    func favoriteItem(){
        if notes?.favorite == true{
            print("Favoriting")
            FavoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else{
            print("UnFavoriting")
            FavoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
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
        
        if let filePath = Bundle.main.path(forResource: notes?.image, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
            NotesImage.contentMode = .scaleAspectFit
            NotesImage.image = image
        }
        
        favoriteItem()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let body = BodyText.text {
            notes?.desc = body
        }
        if let fave = notes?.favorite {
            notes?.favorite = fave
        }
    }


}
