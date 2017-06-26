//
//  BibleViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 20/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class BibleViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: GPSegmentedControl!
    
    @IBOutlet weak var tableViewContainer: UIView!

    @IBOutlet weak var collectionViewContainer: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableViewContainer.isHidden = false
        collectionViewContainer.isHidden  = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedChangedValue(_ sender: GPSegmentedControl) {
        if (sender.selectedIndex == 0) {
            collectionViewContainer.isHidden = true
            tableViewContainer.isHidden = false
        } else {
            collectionViewContainer.isHidden = false
            tableViewContainer.isHidden = true
            
        }
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
