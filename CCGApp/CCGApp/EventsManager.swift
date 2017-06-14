//
//  EventsManager.swift
//  CCGApp
//
//  Created by Matheus Nishi on 13/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import FirebaseDatabase

protocol EventsManagerDelegate {
    func dataReady()
    
}

class EventsManager: NSObject {
    
    var events = [Events]()
    var delegate: EventsManagerDelegate?
    var databaseReference: DatabaseReference! = nil
    var firstUpdate = true
    
    func getEvents(){
        
        self.databaseReference = Database.database().reference()
        
        self.databaseReference.observe(.value, with: { (snapshot) in
            if !self.firstUpdate {
                self.events.removeAll()
            }
            if snapshot.exists() {
                guard let data = snapshot.value as? [String : AnyObject] else {
                    return
                }
                guard let events = data["events"] as? [[String : AnyObject]] else {
                    return
                }
                
                for item in events {
                    guard let nameEvent = item["nameEvent"] as? String else {
                        return
                    }
                    guard let dateString = item["date"] as? String else {
                        return
                    }
                    guard let placeName = item["place"] as? String else {
                        return
                    }
                    let dateFormatter: DateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                    let date = dateFormatter.date(from: dateString)
                    
                    let events = Events(nameEvent: nameEvent, date: date!, place: placeName)
                    
                    self.events.append(events)
                    
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
    
    
}




