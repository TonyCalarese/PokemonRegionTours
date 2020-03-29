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
        return Type(name: "", desc: "", image: nil)
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
