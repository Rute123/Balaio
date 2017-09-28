//
//  CulturalActivities.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/28/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

// Classe pra as atividades culturais
// Teremos um array de CulturalActivities local (pra simular o firebased/cloudKit)
class CulturalActivities {
  
  var activitiesName: String
  var location: CLLocationCoordinate2D
  var endsAt: String // date format
  var tag: Tag
  var shortComment: String
  var likes: Float
  var activitieIsVisible: Bool
  var activitieExists: Bool
  var text: String
  
		
  
  init (activitiesName: String, location: CLLocationCoordinate2D, endsAt: String, tag: Tag, shortComment: String, likes: Float, activitieIsVisible: Bool, activitieExists: Bool, text: String) {
    
    self.activitiesName = activitiesName
    self.location = location
    self.endsAt = endsAt
    self.tag = tag
    self.shortComment = shortComment
    self.likes = likes
    self.activitieIsVisible = activitieIsVisible
    self.activitieExists = activitieExists
    self.text = text
  }
  
}
