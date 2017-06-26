//
//  Versicle.swift
//  CCGApp
//
//  Created by Matheus Nishi on 20/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class Versicle: NSObject {

    var number: Int!
    var body: String!
    
    override init() {
        super.init()
        self.number = 0
        self.body = ""
    }
    
    init(number: Int, body: String) {
        super.init()
        self.number = number
        self.body = body
    }
    
}
