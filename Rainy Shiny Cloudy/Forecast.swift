//
//  Forecast.swift
//  Rainy Shiny Cloudy
//
//  Created by Fahad Rehman on 11/17/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Forecast {
    
    private var _days: String!
    private var _weatherType:String!
    private var _weatherMax: Double!
    private var _weatherMin: Double!
    
    var days:String  {
        if _days == nil {
            _days = ""
        }
        return _days
    }
    var weatherType:String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var weatherMax: Double {
        if _weatherMax == nil {
            _weatherMax = 0.0
        }
        return _weatherMax
    }
    var weatherMin :Double {
        if _weatherMin == nil {
            _weatherMin = 0.0
        }
        return _weatherMin
    }
    
    init (weatherDict : Dictionary<String , AnyObject>) {
        
        if let temp = weatherDict["temp"] as? Dictionary<String,AnyObject> {
            if let min = temp["min"] as? Double {
                let ktc = Double(round(min - 273.15))
                self._weatherMin = ktc
            }
            if let max = temp["max"] as? Double {
                let kt = Double(round(max - 273.15))
                self._weatherMax = kt
                
            }
            
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary <String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let dt = weatherDict["dt"] as? Double {
            let unixconverteddate = Date(timeIntervalSince1970: dt)
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "EEEE"
            dateformatter.dateStyle = .full
            dateformatter.timeStyle = .none
            
            self._days = unixconverteddate.dayOfWeek()
            
        }
    }
}

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}























