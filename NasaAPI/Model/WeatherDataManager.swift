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
                    prInt(error!)
                    return
                }
                
                if let safeData = data {
                    prInt("safe data \(safeData.base64EncodedData())")
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
               
                prInt("Parsing JSON")
                prInt(json)
//                if let photos = json["photos"] as? [Any] {
//                   //prInt(photos)
//                    for photo in photos{
//                        if let dictionary = photo as? [String: Any] {
//
//                            //prInt(dictionary["img_src"])
//                            if let imgURL = dictionary["img_src"] as? String {
//
//                               // let aString = "This is my string"
//                                let imgURLs = imgURL.replacingOccurrences(of: "http", with: "https", options: .literal, range: nil)
//
//                                urls.append(imgURLs)
//                            }
//
//
//                                }
//                    }
//
//                    //prInt(urls)
//                    self.delegate?.didUpdateNasa(picURLs : urls)
//                }
            }
        } catch let error as NSError {
            prInt("Failed to load: \(error.localizedDescription)")
        }

    }

    
    
    
}

