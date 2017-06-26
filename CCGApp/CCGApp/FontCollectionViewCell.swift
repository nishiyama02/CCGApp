//
//  FontCollectionViewCell.swift
//  CCGApp
//
//  Created by Matheus Nishi on 26/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class FontCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fontNameLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            self.fontNameLabel.textColor = isSelected ? UIColor(red: 74/255, green: 140/255, blue: 223/255, alpha: 1) : UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        }
    }
}
