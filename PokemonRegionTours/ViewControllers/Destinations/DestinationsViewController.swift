//
//  FirstViewController.swift
//  PokemonRegionTours
//
//  Created by Garvey, Nicholas and Tony Calarese on 2/21/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class DestinationsViewController: UITableViewController {
    
    var destStore = ItemStore()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDest":
            if let row = tableView.indexPathForSelectedRow?.row {
                let dest = destStore.allItems[row] as! Destination
                let vc = segue.destination as! DestinationDetailViewController
                vc.destination = dest
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if !destStore.loadItems(from: "destinations", of: Destination.self) {
            print("Items did not load!")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        destStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        
        let dest = destStore.allItems[indexPath.row]
        
        cell.title.text = dest.name
        if let imgString = dest.image {
            cell.icon.image = UIImage(named: imgString)
        }
        
        return cell
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        destStore.saveItems(from: "destinations", of: Destination.self)
    }
}

