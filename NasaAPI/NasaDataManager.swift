//
//  NasaDataManager.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 30/1/21.
//

import Foundation

protocol  NasaDataManagerDelegate {
    func didUpdateNasa(picURLs : [String])
}

struct NasaDataManager {
    //https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=900&camera=fhaz&api_key=DEMO_KEY"
    let nasaApiURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=900&camera=fhaz&api_key=DEMO_KEY"
    var delegate: NasaDataManagerDelegate?
    
    func fetchNasaData(){
       
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
                    print("safe data \(safeData.base64EncodedData())")
                    self.parseJSON(nasaData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(nasaData: Data){
        
        do {
            if let json = try JSONSerialization.jsonObject(with: nasaData, options: []) as? [String: Any] {
                print(json)
                // try to read out a string array
//                if let values = json["bpi"] as? [String: Double] {
//
//                    self.delegate?.didUpdateBitcoin(prices: values)
//                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }
    
    
}

