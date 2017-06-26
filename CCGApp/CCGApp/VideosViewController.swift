//
//  VideosTableViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import ProgressHUD

class VideosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, VideoManagerDelegate {
    
    var videos: [Video] = [Video]()
    let videoManager = VideoManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.videoManager.delegate = self
        
        self.tableView.isHidden = true    
        
        if !Reachability().networkVerification() {
            ProgressHUD.showError("Sem Conexão", interaction: false)
            return
        }
        
        self.videoManager.getVideos()
        ProgressHUD.show("Carregando...", interaction: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        
        let title = videos[indexPath.row].title
        cell.titleLabel.text = title

        let thumbnailUrlString = videos[indexPath.row].videoThumbnailUrl
        
        let thumbnailUrl = URL(string: thumbnailUrlString)
        
        if thumbnailUrl != nil {
            
            let request = URLRequest(url: thumbnailUrl!)
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                
                DispatchQueue.main.async {
                    let image = UIImage(data: data!)
                    cell.thumbnailImage.image = image
                }
                
            })
            
            dataTask.resume()
        }
        
        
        

        // Configure the cell...

        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.frame.size.width / 320) * 180
    }
    
    
    // MARK: - VideoManager Delegate Methods
    
    func dataReady() {
        self.videos = self.videoManager.videos
        self.tableView.reloadData()
        self.tableView.isHidden = false
        ProgressHUD.dismiss()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToVideo" {
            let view = segue.destination as! DetailVideoViewController
            view.video = videos[(tableView.indexPathForSelectedRow?.row)!]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
