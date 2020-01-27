//
//  ForecastServies.swift
//  weatherForecast
//
//  Created by Mohamed Elmorsi on 1/20/20.
//  Copyright © 2020 Mohamed Elmorsi. All rights reserved.
//

import Foundation
import Alamofire
class ForecastServies{
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey:String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longtitude: Double, compeltion: @escaping (CurrentWeather?) -> Void){
        
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longtitude)"){
            
          Alamofire.request(forecastURL).responseJSON(completionHandler: { (response) in
          if let jsonDictionary = response.result.value as? [String : Any] {
//            let  networkProcessor = Networkprocessor(url: forecastURL)
//            networkProcessor.downloadJSONFromURL { (jsonDictionary) in
                if let currentWeatherDictinary = jsonDictionary["currently"] as? [String : Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictinary)
                    compeltion(currentWeather)
                }else{
                    compeltion(nil)
                
    }
                }
            })
        }
        
    }
}














