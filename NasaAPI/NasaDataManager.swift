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
                    //print("safe data \(safeData.base64EncodedData())")
                    self.parseJSON(nasaData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON2(nasaData: Data){
//        let jsonData = nasaData(using: .utf8)
//        let root: Root = try! JSONDecoder().decode(Root.self, from: jsonData)
    }
    
    
    
    func parseJSON(nasaData: Data){
        
        do {
            if let json = try JSONSerialization.jsonObject(with:nasaData, options: []) as? [String: Any] {
                // try to read out a string array
                print(json)
                print("Parsing JSON")
                if let photos = json["photos"] as? [Any] {
                    
                    //self.delegate?.didUpdateNasa(prices: values)
                    print("Parsing photos")
                    for photo in photos{
                        let photo1: Photo = try! JSONDecoder().decode(Photo.self, from: photo as! Data)
                        
//                        if let photosURL = photo["img_src"] as? String {
//
//                            //self.delegate?.didUpdateNasa(prices: values)
//                            print("Parsing urls")
//                            print(photosURL)
//                        }
                        print(photo1)
                    }
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }

    
    
    
}

