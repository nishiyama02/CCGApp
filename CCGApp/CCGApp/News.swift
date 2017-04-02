//
//  News.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var title: String?
    var date: Date?
    var url: URL?
    
    
    override init() {
        super.init()
        self.title = ""
        self.date = Date()
        self.url = URL(string: "")
    }
    
    init(title: String, date: Date, url: URL) {
        super.init()
        self.title = title
        self.date = date
        self.url = url
    }
    

}
