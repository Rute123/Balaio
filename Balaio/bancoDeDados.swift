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
var celebrarTag: Tag = Tag(tagName: "Celebração", tagIconColor: UIImage(named: "celebrarTag")!, tagIconColorName: "celebrarTag", tagIconGrayScale: UIImage(named: "celebrarTagPb")!,tagPin:UIImage(named:"celebrarPin")!)

var contemplarTag: Tag = Tag(tagName: "Exibição", tagIconColor: UIImage(named: "contemplarTag")!, tagIconColorName: "contemplarTag", tagIconGrayScale: UIImage(named: "celebrarTagPb")!, tagPin:UIImage(named:"contemplarPin")!)

var colaborarTag: Tag = Tag(tagName: "Colaboração", tagIconColor: UIImage(named:"colaborarTag")!, tagIconColorName: "colaborarTag", tagIconGrayScale: UIImage(named: "colaborarTagPb")!,tagPin:UIImage(named:"colaborarPin")!)

var praticarTag: Tag = Tag(tagName: "Prática", tagIconColor: UIImage(named: "praticarTag")!, tagIconColorName: "praticarTag", tagIconGrayScale: UIImage(named: "praticarTagPb")!,tagPin:UIImage(named:"praticarPin")!)



// array local de CulturalActivities
var bancoDeDados: [CulturalActivities] = [CulturalActivities(activitiesName: "Feirinha no CAC", location: CLLocationCoordinate2DMake(-8.050749, -34.9534873), endsAt: "Acaba de 17h", activitieTag: contemplarTag, shortComment: "Barraquinhas vendendo bolsa, coisa pra cabelo, no precinho XD", likes: 0, activitieIsVisible: true, activitieExists: true),
  
  CulturalActivities(activitiesName: "Party Hard na casa de Maysa", location:CLLocationCoordinate2DMake(-8.035594, -34.9441419), endsAt: "Acaba de 20h30", activitieTag: colaborarTag, shortComment: "A gente entregou o app, bora comemorar!!!"),
  
  CulturalActivities(activitiesName: "Calourada de arquitetura na concha", location: CLLocationCoordinate2DMake(-8.0525066, -34.9524539), endsAt: "Acaba de 23h", activitieTag: celebrarTag, shortComment: "chama o ubi q eu to beba"),
  
  CulturalActivities(activitiesName: "Oficina de Encadernação Artesanal", location: CLLocationCoordinate2DMake(-8.0512811, -34.9542569), endsAt: "Acaba de 11h30", activitieTag: praticarTag, shortComment: "Rolando na sala 5 do dDesign, vai ter sorteio")
]
