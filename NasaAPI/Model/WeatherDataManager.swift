//
//  WeatherDataManager.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 1/3/21.
//

import Foundation


protocol  WeatherDataManagerDelegate {
    func didUpdateWeather(weatherData : [DayReport] )
}

class WeatherDataManager {
    
    
    var delegate: WeatherDataManagerDelegate?
    var nasaDayList = [DayReport]()
    
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
                    //print("weather safe data \(safeData.base64EncodedData())")
                    self.parseJSON(weatherData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
  
    
    func parseJSON(weatherData: Data){
        
        
        do {
            if let json = try JSONSerialization.jsonObject(with:weatherData, options: []) as? [String: Any] {
               
                
               // print(json)
//                if let details = json["806"] as? [String:Any] {
//
//                    //print("Parsing JSON 806 \(details)")
//                   let wDate = details["First_UTC"]
//
//                    self.delegate?.didUpdateWeather(weatherData: wDate as! String  )
//                }
                
                if let dayList = json["sol_keys"] as? [Any] {
                    for date1 in dayList {
                        //print("dayList \(date1)")
                        if let dateDetails = json["\(date1)"] as? [String:Any] {
                            if let details = dateDetails["PRE"] as? [String:Any] {
                                print("\(details)")
                                //print(details["mn"] as! Double)
                                let a = DayReport(av: details["av"] as! Double, mx: details["mx"] as! Double, mn: details["mn"] as! Double, ct: details["ct"] as! Int)
                                
                                self.nasaDayList.append(a)
                                //self.delegate?.didUpdateWeather(weatherData: details )
                                
                            }
                        }
                    }
                    
                }
                self.delegate?.didUpdateWeather(weatherData: nasaDayList    )
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }

    
    
    
}

