//
//  HomePageTechTableViewCell.swift
//  MyCareTeam
//
//  Created by Govin Vatsan on 3/12/16.
//  Copyright © 2016 Govin Vatsan. All rights reserved.
//

import UIKit

class HomePageTechTableViewCell: UITableViewCell {

    @IBOutlet weak var techPhoto: UIImageView!
    @IBOutlet weak var techName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
