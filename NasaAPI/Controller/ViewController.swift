//
//  ViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 29/1/21.
//

import UIKit

class ViewController: UIViewController, NasaDataManagerDelegate {
    
    var index = 0
    var sol = 100
    var nasaURLs = [String]()
    
    @IBOutlet weak var btnTable: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var solText: UITextField!
    
    var dataManager = NasaDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.delegate = self
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "1024")
        dataManager.fetchNasaData(sol: sol)
        btnTable.isEnabled = false
    }
    
    func didUpdateNasa(picURLs: [String]) {
        
       
        nasaURLs = picURLs
        print("didUpdateNasa")
        print(picURLs)
        let url = URL(string: picURLs[index])!
        if index < picURLs.count-1 {
            index += 1
        } else {
            index = 0
        }
        
        print(url)
        downloadImage(from: url)
        DispatchQueue.main.async {
            self.btnTable.isEnabled = true
        }
    }
    


    @IBAction func btnDownload(_ sender: Any) {
        let userSol = solText.text
        print(userSol)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        solText.resignFirstResponder()
        dataManager.fetchNasaData(sol: sol)
        
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PhotoTableViewController
        vc?.nasaURLs = nasaURLs
    }
}

