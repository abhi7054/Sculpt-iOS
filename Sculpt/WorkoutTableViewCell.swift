//
//  WorkoutTableViewCell.swift
//  Sculpt
//
//  Created by Abhishek Dubey on 23/06/20.
//  Copyright © 2020 Dev Abhi. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var exerciseNameTextView: UILabel!
    
    @IBOutlet weak var durationTextView: UILabel!
    
    @IBOutlet weak var difficultyTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
