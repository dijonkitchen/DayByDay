//
//  HomePageScheduleTableViewCell.swift
//  MyCareTeam
//
//  Created by Govin Vatsan on 3/12/16.
//  Copyright © 2016 Govin Vatsan. All rights reserved.
//

import UIKit

class HomePageScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var schedule1: UILabel!
    @IBOutlet weak var schedule2: UILabel!
    @IBOutlet weak var schedule3: UILabel!
    @IBOutlet weak var schedule4: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}