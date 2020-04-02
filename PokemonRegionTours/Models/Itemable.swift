//
//  item.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/28/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit


protocol Itemable : Codable {
    var name: String { get set }
    var desc: String { get set }
    var favorite: Bool { get set }
    var image: String? { get set }
    
    init(name: String, desc: String, image: String?, favorite: Bool)
}
