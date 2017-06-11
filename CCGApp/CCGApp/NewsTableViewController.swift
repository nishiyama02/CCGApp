//
//  NewsTableViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import QuickLook

class NewsTableViewController: UITableViewController, QLPreviewControllerDataSource, NewspaperManagerDelegate {
    
    var allNews = [Newspaper]()
    var pdf = Data()
    let newspaperManager = NewspaperManager()
    var refresher : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notícias"
        
        self.newspaperManager.delegate = self
        
        newspaperManager.getNewspapers()
        refresher  = UIRefreshControl ()
        refresher.attributedTitle = NSAttributedString(string: "Deslize para atualizar")
        refresher.tintColor = UIColor.init(red: 93.0/255.0, green: 161.0/255.0, blue: 226.0/255.0, alpha: 0.8)
        refresher.addTarget(self, action: #selector(NewsTableViewController.updateNewspaperData), for: .valueChanged)
      
        self.tableView.addSubview(refresher)
        tableView.sendSubview(toBack: refresher)
        
        
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
        
        cell.titleCell.text = allNews[indexPath.row].name
        let date = allNews[indexPath.row].date
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date!)-2000
        let month = calendar.component(.month, from: date!)
        
        cell.dateCell.text = "\(month)/\(year)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.newspaperManager.getPDF(self.allNews[indexPath.row])
    }
    
    //MARK: QuickLook DataSources
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int{
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem{
        let filePath = self.allNews[(tableView.indexPathForSelectedRow?.row)!].urlFile

        return filePath! as QLPreviewItem
    }
    
    // Mark: Newspaper Manager Delegate
    
    func dataReady() {
        self.allNews = self.newspaperManager.newspapers
        self.allNews = allNews.sorted {$0.date! > $1.date!}
        self.tableView.reloadData()
        self.refresher.endRefreshing()
    }
    
    func pdfReady(newspaper: Newspaper) {
        self.pdf = self.newspaperManager.pdf
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let path = dir.appendingPathComponent(newspaper.fileName!)
            newspaper.urlFile = path
            do {
                try self.pdf.write(to: path)
            } catch {
                print("Erro - salvando PDF")
            }
        }
        
        let previewPdf = QLPreviewController()
        previewPdf.dataSource = self
        self.navigationController?.pushViewController(previewPdf, animated: true)
    }
    // Mark: UIRefreshControl methods
    
    func updateNewspaperData() {
        self.newspaperManager.getNewspapers()
        self.tableView.reloadData()
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
