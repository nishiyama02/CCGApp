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
        News(title: "Informativo de Dezembro de 2016", date: Date(), url: URL(string: "https://lookaside.fbsbx.com/file/INFORMATIVO%2002_04.pdf?token=AWybFQHOdDB6Hr3T5sv1mdiE7_uPQsaY5PBgl8bcWLY1vUJaZuYlw6lB_q98IY-v3mWc9n9jeu6JzO5X5dvsONjNFoty_y_azzLUPDmVZVf3z1Wj1w_nHdiupuMQmtfcnxhP917QzXr7-qtTN7j69k2b")!),
        News(title: "Informativo de Janeiro de 2017", date: Date(), url: URL(string: "https://lookaside.fbsbx.com/file/INFORMATIVO%2002_04.pdf?token=AWybFQHOdDB6Hr3T5sv1mdiE7_uPQsaY5PBgl8bcWLY1vUJaZuYlw6lB_q98IY-v3mWc9n9jeu6JzO5X5dvsONjNFoty_y_azzLUPDmVZVf3z1Wj1w_nHdiupuMQmtfcnxhP917QzXr7-qtTN7j69k2b")!),
        News(title: "Informativo de Fevereiro de 2017", date: Date(), url: URL(string: "https://lookaside.fbsbx.com/file/INFORMATIVO%2002_04.pdf?token=AWybFQHOdDB6Hr3T5sv1mdiE7_uPQsaY5PBgl8bcWLY1vUJaZuYlw6lB_q98IY-v3mWc9n9jeu6JzO5X5dvsONjNFoty_y_azzLUPDmVZVf3z1Wj1w_nHdiupuMQmtfcnxhP917QzXr7-qtTN7j69k2b")!),
        News(title: "Informativo de Março de 2017", date: Date(), url: URL(string: "https://lookaside.fbsbx.com/file/INFORMATIVO%2002_04.pdf?token=AWybFQHOdDB6Hr3T5sv1mdiE7_uPQsaY5PBgl8bcWLY1vUJaZuYlw6lB_q98IY-v3mWc9n9jeu6JzO5X5dvsONjNFoty_y_azzLUPDmVZVf3z1Wj1w_nHdiupuMQmtfcnxhP917QzXr7-qtTN7j69k2b")!),
        News(title: "Informativo de Abril de 2017", date: Date(), url: URL(string: "https://lookaside.fbsbx.com/file/INFORMATIVO%2002_04.pdf?token=AWybFQHOdDB6Hr3T5sv1mdiE7_uPQsaY5PBgl8bcWLY1vUJaZuYlw6lB_q98IY-v3mWc9n9jeu6JzO5X5dvsONjNFoty_y_azzLUPDmVZVf3z1Wj1w_nHdiupuMQmtfcnxhP917QzXr7-qtTN7j69k2b")!)
    ]
    

}
