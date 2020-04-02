//
//  ExternalLinksViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/19/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class ExternalLinksViewController : UITableViewController {

    let pokemon = ["Pikachu", "Eevee", "Magikarp"]
    let links = ["https://www.pokemon.com/us/pokedex/pikachu",
        "https://www.pokemon.com/us/pokedex/eevee",
        "https://pokemondb.net/pokedex/magikarp"]
    
    let displayed_text = ["Pikachu", "Eevee", "Magikarp"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create an instance of UITableViewCell, with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "linkCell", for: indexPath) as! LinksTableViewCell
        
            let poke = pokemon[indexPath.row]
            let item = links[indexPath.row]
        cell.Pokémon.setTitle(poke, for: .normal)
        
        cell.website = item
            return cell
    }


}
