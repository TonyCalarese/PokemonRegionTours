//
//  LinksTableViewCell.swift
//  PokemonRegionTours
//
//  Created by Tony Calarese on 4/2/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class LinksTableViewCell: UITableViewCell {
    
    var website = ""
    @IBOutlet weak var Pokémon: UIButton!
    //Reference of opening link in safari: https://www.hackingwithswift.com/example-code/system/how-to-open-a-url-in-safari]
    
    @IBAction func GoToSite(_ sender: UIButton) {
        if let url = URL(string: website) {
            UIApplication.shared.open(url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
