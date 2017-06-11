//
//  News.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import Firebase

class Newspaper: NSObject {
    
    var name: String?
    var date: Date?
    var fileName: String?
    var urlFile: URL?
    
    override init() {
        super.init()
        self.name = ""
        self.date = Date()
        self.fileName = ""
        self.urlFile = URL(string: "")
    }
    
    init(name: String, date: Date, fileName: String) {
        super.init()
        self.name = name
        self.date = date
        self.fileName = fileName
        self.urlFile = URL(string: "")
    }
    

}
