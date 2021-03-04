//
//  WeatherDataManager.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 1/3/21.
//

import Foundation


protocol  WeatherDataManagerDelegate {
    func didUpdateWeather(picURLs : [String])
}

struct WeatherDataManager {
    
    
    var delegate: NasaDataManagerDelegate?
    
    func fetchNasaData(sol: Int){
        
        let nasaApiURL = "https://api.nasa.gov/insight_weather/?api_key=DEMO_KEY&feedtype=json&ver=1.0"
       
        performRequest(urlString: nasaApiURL)
    }
    
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    print("weather safe data \(safeData.base64EncodedData())")
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
  
    
    func parseJSON(weatherData: Data){
        
        var urls = [String]()
        
        do {
            if let json = try JSONSerialization.jsonObject(with:weatherData, options: []) as? [String: Any] {
               
                
                print(json)
                if let details = json["806"] as? [String:Any] {
                    
                    print("Parsing JSON 806")
                   print(details["First_UTC"])
                    
                    self.delegate?.didUpdateNasa(picURLs : urls)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }

    
    
    
}

