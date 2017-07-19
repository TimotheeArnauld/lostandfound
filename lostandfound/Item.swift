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
    
    var name: String?
    var phone: String?
    
    var address: String?
    var postalCode: String?
    var city: String?
    var country: String?
    
    var coord: CLLocationCoordinate2D?
    
    override init() {
        
    }
    
    init(object: AnyObject) {
        let contact: AnyObject = object["contact"] as AnyObject
        let location: AnyObject = object["location"] as AnyObject
        
        self.name = object["name"] as? String
        self.phone = contact["phone"] as? String
        self.address = location["address"] as? String
        self.postalCode = location["postalCode"] as? String
        self.city = location["city"] as? String
        self.country = location["country"] as? String
        
        let lat = (location["lat"] as? Double)!
        let lng = (location["lng"] as? Double)!
        
        self.coord = CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
