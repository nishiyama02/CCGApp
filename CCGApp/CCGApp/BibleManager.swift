//
//  BibleManager.swift
//  CCGApp
//
//  Created by Matheus Nishi on 20/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class BibleManager: NSObject {
    
    var jsonBible: [[String: AnyObject]]!
    var books: [Book]!
    
    override init() {
        if let path = Bundle.main.path(forResource: "nvi", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    jsonBible = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [[String: AnyObject]]
                } catch {
                    print("Error")
                }
            }
        }
        self.books = [Book]()
    }
    
    func getBooks() {
        
    }
    
}
