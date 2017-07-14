//
//  Book.swift
//  CCGApp
//
//  Created by Matheus Nishi on 20/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class Book: NSObject {
    
    var name: String!
    var abbreviation: String!
    var chapters: [Chapter]!

    override init() {
        super.init()
        self.chapters = [Chapter]()
        self.abbreviation = ""
        self.name = ""
    }
    
    init(name: String, abbreviation: String) {
        super.init()
        self.chapters = [Chapter]()
        self.abbreviation = name
        self.name = abbreviation
    }
    
    init(name: String, abbreviation: String, chapters: [Chapter]) {
        super.init()
        self.chapters = chapters
        self.abbreviation = ""
        self.name = ""
    }
}
