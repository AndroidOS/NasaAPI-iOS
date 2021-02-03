//
//  ViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 29/1/21.
//

import UIKit

class ViewController: UIViewController, NasaDataManagerDelegate {
    
    
    var dataManager = NasaDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataManager.fetchNasaData()
    }
    
    func didUpdateNasa(picURLs: [String]) {
        print("didUpdateNasa")
        print(picURLs)
    }
    


    @IBAction func btnDownload(_ sender: Any) {
        dataManager.fetchNasaData()
    }
}

