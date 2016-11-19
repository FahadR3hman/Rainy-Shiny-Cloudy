//
//  Constants.swift
//  Rainy Shiny Cloudy
//
//  Created by Fahad Rehman on 11/15/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

import Foundation

let Base_url = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longitude = "&lon="
let appId = "&appid="
let apikey = "6a176255d63b31debf472c8bbb667132"

typealias downloadcomplete = () -> ()


let current_weather = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedinstance.latitude!)&lon=\(Location.sharedinstance.longitude!)&appid=6a176255d63b31debf472c8bbb667132"
let forecastURL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedinstance.latitude!)&lon=\(Location.sharedinstance.longitude!)&cnt=10&mode=json&appid=6a176255d63b31debf472c8bbb667132"

//let forecase_base_url = "http://api.openweathermap.org/data/2.5/forecast/daily?"



