//
//  NotesDetailViewController.swift
//  PokemonRegionTours
//
//  Created by Tony Calarese on 4/1/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {

    @IBOutlet weak var NoteTitle: UITextField!
    @IBOutlet weak var NoteImage: UIImageView!
    @IBOutlet weak var BodyText: UITextView!
    var notes: Notes? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the Default data
        if let userNotes = notes{
            NoteTitle.text = userNotes.name
            if let img = userNotes.image {
                NoteImage.image = UIImage(named: img)
            }
        
            BodyText.text = userNotes.desc
        }
        
        
    }


}
