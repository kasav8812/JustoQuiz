//
//  MapLocationViewController.swift
//  quizJusto
//
//  Created by Charls Salazar on 27/01/22.
//

import UIKit
import MapKit

class MapLocationViewController: UIViewController {
    @IBOutlet weak var mLocationMapKit: MKMapView!
    var mLatitude = 0.0
    var mLongitude = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPin()
    }
    
    func addPin() {
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: mLatitude , longitude: mLongitude)
        annotation.coordinate = centerCoordinate
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mLocationMapKit.addAnnotation(annotation)
        mLocationMapKit.setRegion(coordinateRegion, animated: true)
    }
}
