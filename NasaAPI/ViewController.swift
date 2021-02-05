//
//  ViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 29/1/21.
//

import UIKit

class ViewController: UIViewController, NasaDataManagerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var dataManager = NasaDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "1024")
        dataManager.fetchNasaData()
        
    }
    
    func didUpdateNasa(picURLs: [String]) {
        print("didUpdateNasa")
        print(picURLs)
        let url = URL(string: picURLs[0])!
        print(url)
        downloadImage(from: url)
    }
    


    @IBAction func btnDownload(_ sender: Any) {
        dataManager.fetchNasaData()
        
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                self?.imageView.image = UIImage(data: data)
            }
        }
    }
}

