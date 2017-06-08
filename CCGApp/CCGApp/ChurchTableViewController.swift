//
//  ChurchTableViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 04/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class ChurchTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell!
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "igrejaImageCell", for: indexPath) as! IgrejaImageTableViewCell
            
        } else if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "churchInformationCell", for: indexPath) as! ChurchInformationTableViewCell
        } else {
            cell = UITableViewCell()
        }
        
        return cell
        
        
        // Configure the cell...
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 310
        } else if indexPath.row == 1{
            return 500
        } else {
            return 100
        }
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    @IBAction func likeOnFacebook(_ sender: Any) {
        
        
        let facebookURL = URL(string: "https://www.facebook.com/ccguarulhos/")
        let facebookAppURL = URL(string: "fb://profile/332907883450061")
        
        let app = UIApplication.shared
        
        
        if app.canOpenURL(facebookAppURL!) {
            app.open(facebookAppURL!, options: [:], completionHandler: nil)
        } else {
            app.open(facebookURL!, options: [:], completionHandler: nil)
        }
    }
    
    
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
