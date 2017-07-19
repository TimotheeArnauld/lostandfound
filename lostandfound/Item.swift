//
//  Item.swift
//  lostandfound
//
//  Created by Timothée Arnauld on 19/07/2017.
//  Copyright © 2017 Lost And Found. All rights reserved.
//

import Foundation

//
//  Item.swift
//  TPnote
//
//  Created by Thomas Fouan on 18/05/2017.
//  Copyright © 2017 Thomas Fouan. All rights reserved.
//

import Foundation
import MapKit

class Item: NSObject {
    
    var nature: String?
    var gare: String?
    
    var date: String?
    var type: String?
    var codeGare: String?
    var idGare: String?
    
    //var coord: CLLocationCoordinate2D?
    
    override init() {
        
    }
    
    init(object: AnyObject) {
        let contact: AnyObject = object["contact"] as AnyObject
        let location: AnyObject = object["location"] as AnyObject
        
        self.nature = object["gc_obo_nature_c"] as? String
        self.gare = contact["gc_obo_gare_origine_r_name"] as? String
        self.date = location["date"] as? String
        self.type = location["gc_obo_type_c"] as? String
        self.codeGare = location["gc_obo_gare_origine_r_code_uic_c"] as? String
        self.idGare = location["id"] as? String
        
        //let lat = (location["lat"] as? Double)!
        //let lng = (location["lng"] as? Double)!
        
        //self.coord = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
