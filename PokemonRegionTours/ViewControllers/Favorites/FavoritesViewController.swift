//
//  FavoritesViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/19/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class FavoritesViewController : UITableViewController {
    
    let favStore: ItemStore = ItemStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        favStore.loadItems(from: "destinations", of: Destination.self)
        favStore.allItems = favStore.allItems.filter({ $0.favorite })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        
        let dest = favStore.allItems[indexPath.row]
        
        cell.title.text = dest.name
        if let imgString = dest.image {
            cell.icon.image = UIImage(named: imgString)
        }
        
        return cell
    }

}
