//
//  FirstViewController.swift
//  PokemonRegionTours
//
//  Created by Garvey, Nicholas on 2/21/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class DestinationsViewController: UITableViewController {
    
    var destStore = ItemStore<Destination>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        destStore.allItems.count
    }


}

