//
//  bancoDeDados.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/28/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//
// PARA COESSA PORRA

import Foundation
import CoreLocation   
import UIKit


// As 4 tags - separadas ou num array??
var celebrarTag: Tag = Tag(tagName: "Celebração", tagIconColor: UIImage(named: "red")!, tagIconGrayScale: UIImage(named: "purple")!,tagPin:UIImage(named:"celebrarPin")!)

var exibirTag: Tag = Tag(tagName: "Exibição", tagIconColor: UIImage(named: "orange")!, tagIconGrayScale: UIImage(named: "brown")!, tagPin:UIImage(named:"contemplarPin")!)

var colaborarTag: Tag = Tag(tagName: "Colaboração", tagIconColor: UIImage(named: "colaborarTag")!, tagIconGrayScale: UIImage(named: "lightGreen")!,tagPin:UIImage(named:"colaborarPin")!)

var praticarTag: Tag = Tag(tagName: "Prática", tagIconColor: UIImage(named: "darkBlue")!, tagIconGrayScale: UIImage(named: "lightBlue")!,tagPin:UIImage(named:"praticarPin")!)



// array local de CulturalActivities
var bancoDeDados: [CulturalActivities] = [CulturalActivities(activitiesName: "Feirinha no CAC", location: CLLocationCoordinate2DMake(-8.050749, -34.9534873), endsAt: "Acaba de 17h", activitieTag: exibirTag, shortComment: "barraquinhas vendendo bolsa, coisa pra cabelo, no precinho XD", likes: 0, activitieIsVisible: true, activitieExists: true),
  
  CulturalActivities(activitiesName: "Party Hard na casa de Maysa", location:CLLocationCoordinate2DMake(-8.035594, -34.9441419), endsAt: "Acaba de 20h30", activitieTag: colaborarTag, shortComment: "a gente entregou o app, bora comemorar!!!"),
  
  CulturalActivities(activitiesName: "calourada de arquitetura na concha", location: CLLocationCoordinate2DMake(-8.0525066, -34.9524539), endsAt: "Acaba de 23h", activitieTag: celebrarTag, shortComment: "chama o uber q eu to beba"),
  
  CulturalActivities(activitiesName: "Oficina de Encadernação Artesanal", location: CLLocationCoordinate2DMake(-8.0512811, -34.9542569), endsAt: "Acaba de 11h30", activitieTag: praticarTag, shortComment: "rolando na sala 5 do dDesign, vai ter sorteio")
]
