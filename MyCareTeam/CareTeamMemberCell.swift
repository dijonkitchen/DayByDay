//
//  CareTeamMemberCell.swift
//  MyCareTeam
//
//  Created by Govin Vatsan on 3/12/16.
//  Copyright © 2016 Govin Vatsan. All rights reserved.
//

import UIKit

class CareTeamMemberCell: UITableViewCell {

    @IBOutlet weak var teamMemberInfo: UIButton!
    @IBOutlet weak var teamMemberName: UILabel!
    @IBOutlet weak var teamMemberPhoto: UIImageView!
    @IBOutlet weak var teamMemberEncounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
