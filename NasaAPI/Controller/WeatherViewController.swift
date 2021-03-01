//
//  WeatherViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 1/3/21.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.fetchNasaData(sol: 1000)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
