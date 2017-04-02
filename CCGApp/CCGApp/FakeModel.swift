//
//  FakeModel.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class FakeModel: NSObject {
    
    static let sharedInstance = FakeModel()
    
    let allNews = [
        News(title: "Informativo de Dezembro de 2016", date: Date(), url: URL(string: "file:///Users/MatheusNishiyama/Downloads/INFORMATIVO%2002_04.pdf")!),
        News(title: "Informativo de Janeiro de 2017", date: Date(), url: URL(string: "file:///Users/MatheusNishiyama/Downloads/INFORMATIVO%2002_04.pdf")!),
        News(title: "Informativo de Fevereiro de 2017", date: Date(), url: URL(string: "file:///Users/MatheusNishiyama/Downloads/INFORMATIVO%2002_04.pdf")!),
        News(title: "Informativo de Março de 2017", date: Date(), url: URL(string: "file:///Users/MatheusNishiyama/Downloads/INFORMATIVO%2002_04.pdf")!),
        News(title: "Informativo de Abril de 2017", date: Date(), url: URL(string: "file:///Users/MatheusNishiyama/Downloads/INFORMATIVO%2002_04.pdf")!)
    ]
    

}
