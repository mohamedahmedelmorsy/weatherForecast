//
//  networkprocessor.swift
//  weatherForecast
//
//  Created by Mohamed Elmorsi on 1/20/20.
//  Copyright © 2020 Mohamed Elmorsi. All rights reserved.
//

import Foundation

class Networkprocessor{
    
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    let url: URL
     
    init (url:URL){
        self.url = url
    }
    
    typealias JSONDictionaryHandler = (([String:Any]?) ->Void)
    
    func downloadJSONFromURL (_ completion: @escaping JSONDictionaryHandler){
        
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                if let httpRespones = response as? HTTPURLResponse{
                    switch httpRespones.statusCode {
                    case 200:
                        if let data = data{
                            do{
                                 let jasonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                
                                completion(jasonDictionary as? [String:Any])
                                
                            }catch let error as NSError {
                                print("Error processing json data:\(error.localizedDescription)")
            
                            }
                           
                        }
                    default:
                        print("HTTP respones Code: \(httpRespones.statusCode)")
                    }
                }
            }else {
                print("Erroe:\(error?.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
}














