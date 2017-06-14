//
//  EventsTableViewCell.swift
//  CCGApp
//
//  Created by Matheus Nishi on 14/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateTimeLabel: UILabel!

    @IBOutlet weak var nameEventLabel: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
