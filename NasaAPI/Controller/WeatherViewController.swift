//
//  WeatherViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 1/3/21.
//

import UIKit

class WeatherViewController: UIViewController, WeatherDataManagerDelegate {
    
    
    
    @IBOutlet weak var lblDescription: UILabel!
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchNasaData(sol: 1000)
    }
    

    func didUpdateWeather(weatherData: String) {
        print("didUpdateWeather \(weatherData)")
        
        let mydate = weatherData[weatherData.index(weatherData.startIndex, offsetBy: 3) ..< weatherData.index(weatherData.endIndex, offsetBy: -1)]
        
        DispatchQueue.main.async {
            self.lblDescription.text = String(mydate) as String
        }
        
       
        
    }

}
