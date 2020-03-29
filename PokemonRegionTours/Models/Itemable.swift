//
//  item.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey on 3/28/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit


protocol Itemable : Codable {
    var name: String { get set }
    var desc: String { get set }
    var image: String? { get set }
    
    init(name: String, desc: String, image: String?)
}
