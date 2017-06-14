//
//  Events.swift
//  CCGApp
//
//  Created by Matheus Nishi on 13/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class Events: NSObject {

    var nameEvent: String?
    var date: Date?
    var place: String?
    
    
    override init() {
        super.init()
        self.nameEvent = ""
        self.date = Date()
        self.place = ""
    }
    
    init(nameEvent: String, date: Date, place: String) {
        self.nameEvent = nameEvent
        self.date = date
        self.place = place
    }
    
    
}
