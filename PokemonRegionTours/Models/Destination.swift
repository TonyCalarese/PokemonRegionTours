//
//  Destination.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey on 3/28/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit
import MapKit

class Destination: NSObject, Itemable, MKAnnotation {
    enum CodingKeys: String, CodingKey {
        case name
        case desc
        case image
        case lat
        case long
    }
    required init(name: String, desc: String, image: String?) {
        self.name = name
        self.desc = desc
        self.image = image
        coordinate = CLLocationCoordinate2D()
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        desc = try values.decode(String.self, forKey: .desc)
        image = try values.decode(String.self, forKey: .image)
        let lat: Double = try values.decode(Double.self, forKey: .lat)
        let long: Double = try values.decode(Double.self, forKey: .long)
        coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    var name: String
    var desc: String
    var image: String?
    var coordinate: CLLocationCoordinate2D
    
    convenience init(name: String, desc: String, image: String?, coordinate: CLLocationCoordinate2D) {
        self.init(name: name, desc: desc, image: image)
        self.coordinate = coordinate
    }
    
    var title: String? {return name}
    var subtitle: String? {return desc}
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(desc, forKey: .desc)
        try container.encode(image, forKey: .image)
        try container.encode(coordinate.latitude, forKey: .lat)
        try container.encode(coordinate.longitude, forKey: .long)
    }
}
