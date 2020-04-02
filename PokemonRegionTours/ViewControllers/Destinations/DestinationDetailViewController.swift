//
//  DestinationDetailViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey on 3/31/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit
import MapKit

class DestinationDetailViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var location: MKMapView!
    @IBOutlet weak var destTitle: UILabel!
    @IBOutlet weak var destDesc: UILabel!
    
    var destination: Destination? = nil
    let zoomDistance: CLLocationDistance = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dest = destination {
            location.addAnnotation(dest)
            destTitle.text = dest.name
            destDesc.text = dest.desc
            title = dest.name
            if let img = dest.image {
                photo.image = UIImage(named: img)
            }
            
            let region = MKCoordinateRegion(center: dest.coordinate, latitudinalMeters: zoomDistance, longitudinalMeters: zoomDistance)
            location.setRegion(region, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    


}
