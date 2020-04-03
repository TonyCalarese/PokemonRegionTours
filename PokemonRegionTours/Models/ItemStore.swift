//
//  ItemStore.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/28/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems: Array<Itemable> = [Itemable]()
    
    @discardableResult func createItem<Type: Itemable>() -> Type {
        let newItem = Type(name: "NewItem", desc: "NewItem", image: nil, favorite: false)
        
        allItems.append(newItem)
        
        
        return newItem
    }
    
    @discardableResult func createItem<Type: Itemable>(name: String, desc: String, image: String?, of type: Type) -> Itemable {
        
        let newItem = Type(name: name, desc: desc, image: image, favorite: false)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func loadItems<Type: Itemable>(from plist: String, of type: Type.Type) -> Bool {
        do {
            let url = Bundle.main.url(forResource: plist, withExtension: "plist")!
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            allItems.append(contentsOf: try decoder.decode([Type].self, from: data))
        } catch let error {
            print(error)
            return false
        }
        return true
    }
    
    // https://www.donnywals.com/reading-and-writing-property-list-files-in-swift/
    func loadItems<Type: Itemable>(file: URL, of type: Type.Type) -> Bool {
        do {
            let data = try Data(contentsOf: file)
            let decoder = PropertyListDecoder()
            allItems.append(contentsOf: try decoder.decode([Type].self, from: data))
        } catch let error {
            print(error)
            return false
        }
        return true
    }
    
    func saveItems<Type: Itemable>(file: URL, of type: Type.Type) {
        
        let encoder = PropertyListEncoder()
        
        if let data = try? encoder.encode(allItems as! [Type]) {
            FileManager.default.createFile(atPath: file.path, contents: data, attributes: nil)
        }
        
    }
    
    func saveItems<Type: Itemable>(from plist: String, of type: Type.Type) {
        
        do {
            let encoder = PropertyListEncoder()
            
            if let data = try? encoder.encode(allItems as! [Type]) {
                let url = Bundle.main.url(forResource: plist, withExtension: "plist")
                try data.write(to: url!)
            }
        } catch {
            print("idk")
        }
    }
    
   
}
