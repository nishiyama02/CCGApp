//
//  NewsTableViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import QuickLook

class NewsTableViewController: UITableViewController, QLPreviewControllerDataSource {
    
    var allNews = [News]()
    var refresher : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notícias"
        
        refresher  = UIRefreshControl ()
        refresher.attributedTitle = NSAttributedString(string: "Deslize para atualizar")
        refresher.tintColor = UIColor(red: 74/255.0, green: 140/255.0, blue: 223/255.0, alpha: 1.0)
        self.tableView.addSubview(refresher)
        
        
        
        
        self.allNews = FakeModel.sharedInstance.allNews
        
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
        // #warning Incomplete implementation, return the number of rows
        return allNews.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        
        cell.titleCell.text = allNews[indexPath.row].title
        let date = allNews[indexPath.row].date
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date!)-2000
        let month = calendar.component(.month, from: date!)
        
        
        
        cell.dateCell.text = "\(month)/\(year)"
        
        return cell
    }
    
    //MARK: QuickLook DataSources
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int{
        
        return allNews.count
    }
    
    
    //MARK: Funcao Select
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        
        let previewPdf = QLPreviewController()
        previewPdf.dataSource = self
        previewPdf.currentPreviewItemIndex = indexPath.row
        show(previewPdf, sender: nil)
        
        refresher.endRefreshing()
        
        
        
    }
    
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem{
        let filePath = allNews[index].url
        
        return filePath!as  QLPreviewItem
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
    /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     let indexPath = self.tableView.indexPathForSelectedRow
     
     if segue.identifier == "SegueToPdf" {
     let news = allNews[(indexPath?.row)!]
     
     let controller = segue.destination as! UrlWebViewController
     controller.news = news
     
     }
     
     
     }
     */
}
