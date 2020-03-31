//
//  ItemStore.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/28/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class ItemStore<Type: Itemable> {
    var allItems = [Type]()
    
    @discardableResult func createItem() -> Type {
        return Type(name: "NewItem", desc: "NewItem", image: nil)
    }
    
    @discardableResult func createItem(name: String, desc: String, image: String?) -> Type {
        return Type(name: name, desc: desc, image: image)
    }
    
    func loadItems(from plist: String) -> Bool {
        do {
            let url = Bundle.main.url(forResource: plist, withExtension: "plist")!
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            allItems = try decoder.decode([Type].self, from: data)
        } catch let error {
            print(error)
            return false
        }
        return true
    }
    
   
}
