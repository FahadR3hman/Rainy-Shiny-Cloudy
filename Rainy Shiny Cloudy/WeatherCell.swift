//
//  WeatherCell.swift
//  Rainy Shiny Cloudy
//
//  Created by Fahad Rehman on 11/18/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var tableImageView: UIImageView!
    
    
    @IBOutlet weak var day: UILabel!
    
    
    @IBOutlet weak var weatherType: UILabel!
    
    
    @IBOutlet weak var weatherMax: UILabel!
    
    
    @IBOutlet weak var weatherMin: UILabel!
    
    func updateTableView(forecast: Forecast) {
        
        day.text = forecast.days
        weatherType.text = forecast.weatherType
        weatherMax.text = "\(forecast.weatherMax)"
        weatherMin.text = "\(forecast.weatherMin)"
        tableImageView.image = UIImage(named: forecast.weatherType)
        
    }

    

}
