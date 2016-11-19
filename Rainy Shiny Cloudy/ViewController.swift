
//
//  ViewController.swift
//  Rainy Shiny Cloudy
//
//  Created by Fahad Rehman on 11/14/16.
//  Copyright © 2016 Codecture. All rights reserved.
//

// 6a176255d63b31debf472c8bbb667132 Weather Api Key

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , CLLocationManagerDelegate {

    @IBOutlet weak var todaysDate: UILabel!
    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var currentCity: UILabel!
    
    @IBOutlet weak var currentTempImage: UIImageView!
    
    @IBOutlet weak var currentWeatherType: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var locationManager = CLLocationManager()
    var currentlocation = CLLocation()
    
    var currentWeather1 = CurrentWeather()
    //var forecast1 = Forecast()
    var forecastsArray = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        authstatus()
    }
    
    func authstatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            
            currentlocation = locationManager.location!
            
           Location.sharedinstance.latitude = currentlocation.coordinate.latitude
           Location.sharedinstance.longitude = currentlocation.coordinate.longitude
            
            currentWeather1.downloadcurrentweather {
                self.downloadforecast {
                    self.updateUI()
                }
                
                
            }

            
            print(currentlocation.coordinate.latitude)
            print(currentlocation.coordinate.longitude)
            

            
        }
        else {
            locationManager.requestWhenInUseAuthorization()
            authstatus()
        }
    }
    
   
    func downloadforecast (download : downloadcomplete) {
        //downloading forecase for the tableview
        
        
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String , AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecastsArray.append(forecast)
                        print(obj)
                    }
                }
            }
           //self.forecastsArray.remove(at: 0)
            self.tableView.reloadData()
        }
       download()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weather", for: indexPath) as? WeatherCell {
            let forecast = forecastsArray[indexPath.row]
            cell.updateTableView(forecast: forecast)
            
        return cell
        }
        return WeatherCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastsArray.count
    }
    func updateUI() {
        todaysDate.text = currentWeather1.currentDate
        currentCity.text = currentWeather1.currentcity
        currentWeatherType.text = currentWeather1.currentweathertype
        currentTemp.text = "\(currentWeather1.currentTemperature)ºc"
        currentTempImage.image = UIImage(named: currentWeather1.currentweathertype)
        
    }

}



































