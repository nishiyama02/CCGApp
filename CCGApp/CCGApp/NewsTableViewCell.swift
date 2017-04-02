//
//  NewsTableViewCell.swift
//  CCGApp
//
//  Created by Matheus Nishi on 01/04/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateCell: UILabel!
    @IBOutlet weak var titleCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        dateCell.layer.cornerRadius = 30.5
        dateCell.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
