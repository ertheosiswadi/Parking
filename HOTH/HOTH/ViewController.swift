//
//  ViewController.swift
//  HOTH
//
//  Created by Denise Wang on 11/17/18.
//  Copyright © 2018 Denise Wang. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {
    

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var SearchBar: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBAction func ButtonAction(_ sender: Any) {
        print(SearchBar.text!)
        if(SearchBar.text?.lowercased() == "gayley"){
            self.mapView.setCenter(CLLocationCoordinate2D(latitude: 34.069359, longitude: -118.450367), animated: true)
        }
        else if(SearchBar.text?.lowercased() == "ralphs"){
            self.mapView.setCenter(CLLocationCoordinate2D(latitude:34.062417, longitude: -118.443689), animated: true)
        }
    }
    
    let apihelper = APIHelper.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        Button.setTitle("Search", for: UIControlState.normal)
        SearchBar.backgroundColor = UIColor.white
        mapView.register(ArtworkMarkerView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let initialLocation = CLLocation(latitude: 34.069359, longitude: -118.450367)
        centerMapOnLocation(location: initialLocation)
        // show artwork on map
        DispatchQueue.global(qos: .background).async{
            self.apihelper.getRequest{ (data) in
                let parking1 = Artwork(title: "parking spot 1", locationName: "Gayley", discipline: self.getString(d: data["gayley"]![0]), coordinate: CLLocationCoordinate2D(latitude: 34.069359, longitude: -118.450367))
                let parking2 = Artwork(title: "parking spot 2", locationName: "Gayley", discipline: self.getString(d: data["gayley"]![1]), coordinate: CLLocationCoordinate2D(latitude: 34.068881, longitude: -118.449408))
                let parking3 = Artwork(title: "parking spot 3", locationName: "Gayley", discipline: self.getString(d: data["gayley"]![2]), coordinate: CLLocationCoordinate2D(latitude: 34.070287, longitude: -118.451950))
                let parking4 = Artwork(title: "parking spot 4", locationName: "Gayley", discipline: self.getString(d: data["gayley"]![3]), coordinate: CLLocationCoordinate2D(latitude: 34.067913, longitude: -118.449465))
                let parking5 = Artwork(title: "parking spot 5", locationName: "Gayley", discipline: self.getString(d: data["gayley"]![4]), coordinate: CLLocationCoordinate2D(latitude: 34.068112, longitude: -118.450563))
                let parking6 = Artwork(title: "parking spot 6", locationName: "Ralphs", discipline: self.getString(d: data["ralphs"]![0]), coordinate: CLLocationCoordinate2D(latitude:34.062417, longitude: -118.443689))
                let parking7 = Artwork(title: "parking spot 7", locationName: "Ralphs", discipline: self.getString(d: data["ralphs"]![1]), coordinate: CLLocationCoordinate2D(latitude:34.061622, longitude: -118.444309))
                let parking8 = Artwork(title: "parking spot 8", locationName: "Ralphs", discipline: self.getString(d: data["ralphs"]![2]), coordinate: CLLocationCoordinate2D(latitude:34.063685, longitude: -118.443053))
                DispatchQueue.main.async {
                    self.mapView.addAnnotation(parking1)
                    self.mapView.addAnnotation(parking2)
                    self.mapView.addAnnotation(parking3)
                    self.mapView.addAnnotation(parking4)
                    self.mapView.addAnnotation(parking5)
                    self.mapView.addAnnotation(parking6)
                    self.mapView.addAnnotation(parking7)
                    self.mapView.addAnnotation(parking8)
                    self.mapView.setCenter(parking1.coordinate, animated: true)
                }
            }
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.

        
        
    }
    let regionRadius: CLLocationDistance = 400
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated:true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getString(d : Bool) -> String{
        if(d)
        {
            return "Yes";
        }
        else{
            return "No";
        }
    }
    
}
