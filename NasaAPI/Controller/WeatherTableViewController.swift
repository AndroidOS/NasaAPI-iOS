//
//  WeatherViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 1/3/21.
//

import UIKit

class WeatherTableViewController: UITableViewController, WeatherDataManagerDelegate  {
    
    
    
    let myList = [1,2,3,4,5]
    
    var dataManager = WeatherDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        dataManager.fetchNasaData(sol: 1000)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        
        cell.textLabel?.text = "\(myList[indexPath.row])"

        return cell
    }
    

    func didUpdateWeather(weatherData: String) {
        //print("didUpdateWeather \(weatherData)")
        
        
        
        DispatchQueue.main.async {
            
        }
        
       
        
    }
    
    

}
