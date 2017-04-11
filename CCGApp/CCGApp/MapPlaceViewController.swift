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
    
    @IBAction func howToGetButton(_ sender: UIButton) {
    }
    
    
    
   
    
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
        
        
        
       
        
        mapCcg.addAnnotation(annotation)
        mapCcg.selectAnnotation(annotation, animated: true)
        
        
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
