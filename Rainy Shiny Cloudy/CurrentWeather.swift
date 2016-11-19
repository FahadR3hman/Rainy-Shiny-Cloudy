//
//  CurrentWeather.swift
//  Rainy Shiny Cloudy
//
//  Created by Fahad Rehman on 11/15/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class CurrentWeather {
    private var _currentDate: String!
    private var _currentcity: String!
    private var _currentweathertype:String!
    private var _currentTemperature:Double!
    
    var currentDate:String {
        if _currentDate == nil {
            _currentDate = ""
        }
        let dateformater = DateFormatter()
        dateformater.dateStyle = .long
        dateformater.timeStyle = .none
        let datedate = dateformater.string(from: Date())
        self._currentDate = "\(datedate)"
        
        return _currentDate
    }
    var currentcity:String {
        if _currentcity == nil {
            _currentcity = ""
        }
        return _currentcity
    }
    
    var currentweathertype:String {
        if _currentweathertype == nil {
            _currentweathertype = "No Weather Available"
        }
        
        return _currentweathertype
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        
        return _currentTemperature
    }
    
    func downloadcurrentweather(download: @escaping downloadcomplete) {
        //using alamofire here.
        
        
        
        
        Alamofire.request(current_weather).responseJSON { resopnse in
            let result = resopnse.result //every request has a response and every response has a result
            //print(resopnse)
            
            if let dict = result.value as? Dictionary <String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._currentcity = name
                    
                    print(self._currentcity)
                }
                
                if let weather = dict["weather"] as? [Dictionary <String, AnyObject>] { //as in the weather api weather is array of dictionary
                    if let main  = weather[0]["main"] as? String { // as the index no of weather is 0
                        self._currentweathertype = main
                        
                        print(self._currentweathertype)
                    }
                }
                
                if let temp = dict["main"] as? Dictionary<String,AnyObject> {
                    if let tempmain = temp["temp"] as? Double {
                        
                        let ktc = Double(round(tempmain - 273.15)) //ktc == kelvin to celcius
                        self._currentTemperature = ktc
                        
                        print(self._currentTemperature)
                    }
                }
            }
            download ()
        }
    }
}










