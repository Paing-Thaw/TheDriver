//
//  DetailViewController.swift
//  TheDriver
//
//  Created by Eureka Tatsu on 1/6/22.
//

import UIKit
import Foundation
import MapKit

class DetailViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var image = UIImage()
    var name = ""
    var destination = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(latitude)
        nameLabel.text = name
        img.image = image
        destinationLabel.text = destination
        
        let annontation = MKPointAnnotation()
        annontation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.addAnnotation(annontation)
        let region = MKCoordinateRegion(center: annontation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        mapView.setRegion(region, animated: true)
    }
}
