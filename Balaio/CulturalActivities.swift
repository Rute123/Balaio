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
  
  var activitieName: String
  var location: CLLocationCoordinate2D
  var endsAt: String // date format
  var tag: Tag
  var commentLabel: String = "O que você ta achando da atividade?"
  var shortComment: String
  var likes: Float = 0
  var activitieIsVisible: Bool = true
  var activitieExists: Bool = true     // não ta indo
  
  // init com tudo
  init (activitiesName: String, location: CLLocationCoordinate2D, endsAt: String, tag: Tag, shortComment: String, likes: Float, activitieIsVisible: Bool, activitieExists: Bool) {
    
    self.activitieName = activitiesName
    self.location = location
    self.endsAt = endsAt
    self.tag = tag
    self.shortComment = shortComment
    self.likes = likes
    self.activitieIsVisible = activitieIsVisible
    self.activitieExists = activitieExists
  }
  
  // init só com os parâmetros que o usuário adiciona
  init (activitiesName: String, location: CLLocationCoordinate2D, endsAt: String, tag: Tag, shortComment: String) {
    
    self.activitieName = activitiesName
    self.location = location
    self.endsAt = endsAt
    self.tag = tag
    self.shortComment = shortComment
  }
  
//  // Date Formatt
//  func string(from date: Date) -> String {
//  
//  }


  
  
  
}



