//
//  ActivityPin.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/29/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import Foundation
import MapKit

// Classe pros nossos pins, associados com uma CulturalActivitie
class ActivityPin: MKPointAnnotation {
  
  let activity: CulturalActivities
  
  init (activity: CulturalActivities) {
    self.activity = activity
    super.init()
  }
  
}
