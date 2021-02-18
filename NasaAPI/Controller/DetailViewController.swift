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
        print("share button pressed")
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
