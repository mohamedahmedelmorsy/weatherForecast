//
//  CurrentWeatherViewController.swift
//  weatherForecast
//
//  Created by Mohamed Elmorsi on 1/20/20.
//  Copyright © 2020 Mohamed Elmorsi. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureTextLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var FahrnhietTextLabel: UILabel!
    
    
    let forecastAPIKey = "82571c2e06f29e7814d529892c7ed7f5"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastServies!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         forecastService = ForecastServies(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longtitude: coordinate.long) { (currentWeather) in
            if let currentWeather = currentWeather {
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temperature{
                        self.temperatureTextLabel.text = "\(temperature)°"
                    }else{
                        self.temperatureTextLabel.text = "A"
                    }
                }
            }
        }
      
    }
    


}
