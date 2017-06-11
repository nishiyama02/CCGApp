//
//  NewspaperManager.swift
//  CCGApp
//
//  Created by Matheus Nishi on 10/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

protocol NewspaperManagerDelegate {
    func dataReady()
    func pdfReady(newspaper: Newspaper)
}

class NewspaperManager: NSObject {
    
    var newspapers = [Newspaper]()
    var pdf: Data! = nil
    var delegate: NewspaperManagerDelegate?
    var storageReference: StorageReference! = nil
    var databaseReference: DatabaseReference! = nil
    var storage: Storage! = nil
    var firstUpdate = true

    
    func getNewspapers() {
        self.databaseReference = Database.database().reference()
        
        self.databaseReference.observe(.value, with: { (snapshot) in
            if !self.firstUpdate {
                self.newspapers.removeAll()
            }
            if snapshot.exists() {
                guard let data = snapshot.value as? [String : AnyObject] else {
                    return
                }
                guard let refStorage = data["storage-reference"] as? String else {
                    return
                }
                guard let newspapers = data["newspapers"] as? [[String : AnyObject]] else {
                    return
                }
                
                self.storage = Storage.storage()
                self.storageReference = self.storage.reference(forURL: refStorage)
                
                for item in newspapers {
                    guard let name = item["name"] as? String else {
                        return
                    }
                    guard let dateString = item["date"] as? String else {
                        return
                    }
                    guard let fileName = item["file-name"] as? String else {
                        return
                    }
                    
                    let dateFormatter: DateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    let date = dateFormatter.date(from: dateString)
                    
                    let newspaper = Newspaper(name: name, date: date!, fileName: fileName)
                 
                    self.newspapers.append(newspaper)
                    self.firstUpdate = false
                    if self.delegate != nil {
                        self.delegate!.dataReady()
                    }
                }
            } else {
                return
            }
        })
    }
    
    
    func getPDF(_ newspaper: Newspaper) {
        let pdfReference = self.storageReference.child(newspaper.fileName!)
        
        pdfReference.getData(maxSize: 2*1024*1024, completion: { (data, error) in
            if error != nil {
                print(String(describing: error))
                return
            } else {
                self.pdf = data
                if self.delegate != nil {
                    self.delegate!.pdfReady(newspaper: newspaper)
                }
            }
        })
    }
}
