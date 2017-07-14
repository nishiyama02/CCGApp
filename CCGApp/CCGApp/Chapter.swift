//
//  Chapter.swift
//  CCGApp
//
//  Created by Matheus Nishi on 20/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class Chapter: NSObject {

    var versicles: [Versicle]!
    var number: Int!
    
    override init() {
        super.init()
        self.versicles = [Versicle]()
        self.number = 0
    }
    
    init(number: Int) {
        super.init()
        self.versicles = [Versicle]()
        self.number = number
    }
    
    init(number: Int, versicle: [Versicle]) {
        self.versicles = versicle
        self.number = number
    }
}
