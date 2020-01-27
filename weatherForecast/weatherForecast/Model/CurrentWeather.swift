//
//  CurrentWeather.swift
//  weatherForecast
//
//  Created by Mohamed Elmorsi on 1/20/20.
//  Copyright © 2020 Mohamed Elmorsi. All rights reserved.
//

import Foundation

class CurrentWeather
{
    
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    init(weatherDictionary: [String : Any]) {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double{
            humidity = Int(humidityDouble * 100)
        }else{
            humidity = nil
        }

        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double{
            precipProbability = Int(precipDouble * 100)
        }else{
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
}




















