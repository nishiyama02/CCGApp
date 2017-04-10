//
//  CurtaJovensViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 08/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class CurtaJovensViewController: UIViewController {
    
    @IBOutlet weak var webViewJovens: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let url = URL(string: "https://www.facebook.com/jovens.ccg/")
        let request = URLRequest(url: url!)
        self.webViewJovens.loadRequest(request)
        
        // Do any additional setup after loading the view.
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
