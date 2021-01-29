//
//  ViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 29/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    var dataManager = NasaDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataManager.fetchNasaData()
    }


    @IBAction func btnDownload(_ sender: Any) {
        dataManager.fetchNasaData()
    }
}

