//
//  MapPlaceViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 09/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import MapKit

class MapPlaceViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapCcg: MKMapView!
    @IBOutlet weak var howToGetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Localização"
        self.mapCcg.delegate = self
        
        let span :MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let location :CLLocationCoordinate2D = CLLocationCoordinate2DMake(-23.452359, -46.534200)
        let region :MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapCcg.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        
        annotation.coordinate = location
        annotation.title = "Comunidade Cristã em Guarulhos"
        annotation.subtitle = "Igreja"
        
        let color = UIColor(red: 74.0/255.0, green: 140.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        self.howToGetButton.layer.borderColor = color.cgColor

        
       
        
        
        mapCcg.addAnnotation(annotation)
        mapCcg.selectAnnotation(annotation, animated: true)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func howToGetButton(_ sender: UIButton) {
        
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            UIApplication.shared.open(URL(string:
                "comgooglemaps://?center=-23.452359,46.534200&zoom=14&views=traffic")!)
        } else {
            print("Can't use comgooglemaps://");
        }
    }
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation is MKUserLocation) { return nil }
        
        let reuseID = "CcgPino"
        var v = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        
        if v != nil {
            v!.annotation = annotation
        } else {
            v = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            
            v!.image = UIImage(named:"CcgPino")
            v!.backgroundColor = UIColor.clear
            v!.canShowCallout = true
            v?.rightCalloutAccessoryView = UIButton(type: .infoLight)
            
            
            
            
            
        }
        
        return v
    }
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
