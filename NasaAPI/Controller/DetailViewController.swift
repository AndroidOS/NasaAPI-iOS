//
//  DetailViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 17/2/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image = UIImage(named: "1024")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
    }
    

    @IBAction func btnShare(_ sender: UIBarButtonItem) {
        prInt("share button pressed")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PDFViewController
        vc?.image = image
    }
    

}
