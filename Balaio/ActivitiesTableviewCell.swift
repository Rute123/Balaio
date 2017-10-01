//
//  ActivitiesTableviewCell.swift
//  Balaio
//
//  Created by Rute Maxsuelly Aquino de Moura on 28/09/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import UIKit

class ActivitiesTableviewCell: UITableViewCell {

  
  @IBOutlet weak var nameActivities: UILabel!
  
  @IBOutlet weak var hourActivities: UILabel!
  
  @IBOutlet weak var tagImageActivities: UIImageView!
  
  
  @IBOutlet weak var descriptionActivities: UILabel!
  
  @IBOutlet weak var textActivities: UILabel!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  


}
