//
//  MapPlaceViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 09/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import MapKit

class MapPlaceViewController: UIViewController {
    
    @IBOutlet weak var mapCcg: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span :MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let location :CLLocationCoordinate2D = CLLocationCoordinate2DMake(-23.452359, -46.534200)
        let region :MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapCcg.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Comunidade Cristã em Guarulhos"
        annotation.subtitle = "Igreja"
        mapCcg.addAnnotation(annotation)
        
        
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
