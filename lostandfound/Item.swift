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
//  
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
        let records: AnyObject = object["records"] as AnyObject
        let fields: AnyObject = object["fields"] as AnyObject
        
        self.nature = object["gc_obo_nature_c"] as? String
        self.gare = records["gc_obo_gare_origine_r_name"] as? String
        self.date = fields["date"] as? String
        self.type = fields["gc_obo_type_c"] as? String
        self.codeGare = records["gc_obo_gare_origine_r_code_uic_c"] as? String
        self.idGare = records["id"] as? String
        
        //let lat = (location["lat"] as? Double)!
        //let lng = (location["lng"] as? Double)!
        
        //self.coord = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
