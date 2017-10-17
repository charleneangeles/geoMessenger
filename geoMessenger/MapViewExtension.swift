//
//  MapViewExtension.swift
//  geoMessenger
//
//  Created by Charlene Angeles on 10/16/17.
//  Copyright © 2017 deHao. All rights reserved.
//

import UIKit
import MapKit

extension  FirstViewController: MKMapViewDelegate{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 43.038247, longitude: -87.927767)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        
        let message = Message(title: "the Bucks are legit!",
                              locationName: "Bradley Center",
                              username: "John Smith",
                              coordinate: CLLocationCoordinate2D(latitude:43.038247, longitude: -87.927767 ), isDisabled: false)
        mapView.addAnnotation(message)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation =  annotation as? Message {
            let identifier = "Pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView (annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -8, y: -5)
                view.pinTintColor = .green
                view.animatesDrop = true
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIButton
            }
            return view
        }
        return nil
    }


    private func mapView(_ mapView: MKMapView, annotationView view: MKPinAnnotationView, calloutAccessoryControlTapped control: UIControl){
    let message = view.annotation  as! Message
    let placeName = message.title
    let placeInfo = message.subtitle
    
    let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    
    ac.addAction(UIAlertAction(title: "Remove", style: .default){
        (result : UIAlertAction) -> Void in mapView.removeAnnotation(message)
    })
        present(ac, animated: true) }
    
    
    
}
