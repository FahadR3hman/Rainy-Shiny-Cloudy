//
//  Location.swift
//  Rainy Shiny Cloudy
//
//  Created by Fahad Rehman on 11/18/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedinstance = Location()
   private init() {
        
    }
    
    var longitude : Double!
    var latitude : Double!
}
