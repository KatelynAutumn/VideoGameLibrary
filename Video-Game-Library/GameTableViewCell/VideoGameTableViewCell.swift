//
//  VideoGameTableViewCell.swift
//  Video-Game-Library
//
//  Created by Katelyn Pace on 10/15/18.
//  Copyright © 2018 Katelyn Pace. All rights reserved.
//

import UIKit

class VideoGameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var GenreLabel: UILabel!
    
    @IBOutlet weak var RatingLabel: UILabel!

    @IBOutlet weak var DueDateLabel: UILabel!
    
    @IBOutlet weak var AvailabilityColor: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
