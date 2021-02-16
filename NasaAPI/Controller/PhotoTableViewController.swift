//
//  PhotoTableViewController.swift
//  NasaAPI
//
//  Created by Manuel Carvalho on 10/2/21.
//

import UIKit

class PhotoTableViewController: UITableViewController {

    let myList = [1,2,3,4,5]
    
    var nasaURLs = [String]()
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(images.count)
        //getImages()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.imageView?.image = images[indexPath.row]
            print("Image \(indexPath.row)")
            
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detail", sender: self)
    }


}
