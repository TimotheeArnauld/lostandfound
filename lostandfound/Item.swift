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
        let fields: AnyObject = object["fields"] as AnyObject
        
        self.nature = fields["gc_obo_nature_c"] as? String
        self.gare = fields["gc_obo_gare_origine_r_name"] as? String
        self.date = fields["date"] as? String
        self.type = fields["gc_obo_type_c"] as? String
        self.codeGare = fields["gc_obo_gare_origine_r_code_uic_c"] as? String
        self.idGare = fields["id"] as? String
    }
}
