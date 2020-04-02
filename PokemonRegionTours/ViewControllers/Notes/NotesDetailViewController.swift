//
//  NotesDetailViewController.swift
//  PokemonRegionTours
//
//  Created by Tony Calarese on 4/1/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
    var notes: Notes? = nil
    var imageString: String = "Eevee"
    
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
            UIImage(contentsOfFile: String)
            notes?.image = image
        }
    }


}
