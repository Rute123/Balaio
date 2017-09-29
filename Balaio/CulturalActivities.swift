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
  
  // inicializando tudo aqui, pra criar o inicializador vazio
  var activitieName: String = ""
  var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(-8.050749, -34.9534873) // só pra teste
  var endsAt: String = "" // tem que ser do tipo Date - date formatt
  var tag: Tag = praticarTag  // só pra teste
  var commentLabel: String = "O que você ta achando da atividade?"
  var shortComment: String = ""
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
  
  // init sem nada
  init() {
  }
  
  
//  // Date Formatt
//  func string(from date: Date) -> String {
//  
//  }


  
  
  
}



