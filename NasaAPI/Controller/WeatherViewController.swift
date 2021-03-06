//
//  WeatherViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 1/3/21.
//

import UIKit

class WeatherViewController: UIViewController, WeatherDataManagerDelegate {
    
    
    
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.fetchNasaData(sol: 1000)
    }
    

    func didUpdateWeather(weatherData: String) {
        print("didUpdateWeather")
    }

}
