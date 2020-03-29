//
//  Notes.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/29/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class Notes: NSObject, Itemable {
    var name: String
    var desc: String
    var image: String?
    
    required init(name: String, desc: String, image: String?) {
        self.name = name
        self.desc = desc
        self.image = image
    }
    
    
}
