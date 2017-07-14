//
//  BibleManager.swift
//  CCGApp
//
//  Created by Matheus Nishi on 20/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class BibleManager: NSObject {
    
    public static let sharedInstance = BibleManager()
    
    private var bible = [Book]()
    var selectedBook = Book()
    var selectedChapter = Chapter()
    
    override init() {
        if let path = Bundle.main.path(forResource: "nvi", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                do {
                    let jsonBible = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [[String: AnyObject]]
                    
                    for item in jsonBible {
                        let book = Book()
                        var chapters = [Chapter]()
                        var versicles = [Versicle]()
                        
                        guard let name = item["book"] as? String else {
                            print("Erro na criação da bíblia, \(#line), \(#function)")
                            return
                        }
                        
                        guard let abbrev = item["abbrev"] as? String else{
                            print("Erro na criação da bíblia, \(#line), \(#function)")
                            return
                        }
                        
                        book.name = name
                        book.abbreviation = abbrev
                        
                        guard let chaptersDictionary = item["chapters"] as? [[String: AnyObject]] else {
                            print("Erro na criação da bíblia, \(#line), \(#function)")
                            return
                        }
                        
                        var i = 1
                        for item in chaptersDictionary {
                            let chapter = Chapter()
                            guard let versiclesDictionary = item["\(i)"] as? [String: AnyObject] else {
                                print("Erro na criação da bíblia, \(#line), \(#function)")
                                return
                            }
                            chapter.number = i
                            i = i + 1
                            
                            for j in 1...versiclesDictionary.count {
                                guard let body = versiclesDictionary["\(j)"] as? String else {
                                    print("Erro na criação da bíblia, \(#line), \(#function)")
                                    return
                                }
                                let versicle = Versicle(number: Int("\(j)")!, body: body)
                                versicles.append(versicle)
                                
                            }
                            chapter.versicles = versicles
                            versicles.removeAll()
                            chapters.append(chapter)
                        }
                        book.chapters = chapters
                        self.bible.append(book)
                        self.selectedBook = bible[0]
                    }
                } catch {
                    print("Error")
                    return
                }
            }
        }
    }
    
    public func getAllBooks() -> [Book] {
        return self.bible
    }
    
    public func getBook() -> Book {
        return self.selectedBook
    }
    
    public func selectBook(book: Book) {
        self.selectedBook = book
    }
    
    public func getChapter() -> Chapter {
        return self.selectedChapter
    }
    
    public func selectChapter(chapter: Chapter) {
        self.selectedChapter = chapter
    }
    
}
