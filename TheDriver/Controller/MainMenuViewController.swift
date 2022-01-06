//
//  MainMenuViewController.swift
//  TheDriver
//
//  Created by Eureka Tatsu on 1/5/22.
//

import Foundation
import UIKit
import Firebase

class MainMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TheDriver"
        tableview.delegate = self
        tableview.dataSource = self
        navigationItem.hidesBackButton = true
    }
    
    let latitude = [16.9042, 16.8346, 16.8489, 16.8108, 24.6572, ]
    let longitude = [ 16.9042, 16.8346, 96.1792, 96.1766, 46.8345 ]
    let names = [   "Maung Maung",
                    "Kyaw Kyaw",
                    "Hla Hla",
                    "Daw Khin",
                    "U Aung"    ]
    
    let destination = [ "Insein",
    "Yankin", "South Okkalapa", "Tar Mwe", "Su Lay"]
    
    @IBOutlet weak var tableview: UITableView!

    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try  Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension MainMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            vc?.image = UIImage(named: self.names[indexPath.row])!
            vc?.name = self.names[indexPath.row]
            vc?.destination = self.destination[indexPath.row]
            vc?.latitude = self.latitude[indexPath.row]
            vc?.longitude = self.longitude[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
}

extension MainMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainMenuTableViewCell
        cell.nameLable.text = names[indexPath.row]
        cell.destinationLabel.text = destination[indexPath.row]
        cell.imgView.image = UIImage(named: names[indexPath.row] )
        return cell
    }
    
    
}
