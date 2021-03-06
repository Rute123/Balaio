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
var celebrarTag: Tag = Tag(tagName: "Celebração", tagIconColor: UIImage(named: "celebrarTag")!, tagIconColorName: "celebrarTag", tagIconGrayScale: UIImage(named: "celebrarTagPb")!,tagPin:UIImage(named:"celebrarPin")!, tagColor: UIColor(colorLiteralRed: 206, green: 77, blue: 78, alpha: 1))

var contemplarTag: Tag = Tag(tagName: "Exibição", tagIconColor: UIImage(named: "contemplarTag")!, tagIconColorName: "contemplarTag", tagIconGrayScale: UIImage(named: "celebrarTagPb")!, tagPin:UIImage(named:"contemplarPin")!, tagColor: UIColor(colorLiteralRed: 41, green: 206, blue: 182, alpha: 1))

var colaborarTag: Tag = Tag(tagName: "Colaboração", tagIconColor: UIImage(named:"colaborarTag")!, tagIconColorName: "colaborarTag", tagIconGrayScale: UIImage(named: "colaborarTagPb")!,tagPin:UIImage(named:"colaborarPin")!, tagColor: UIColor(colorLiteralRed: 175, green: 70, blue: 135, alpha: 1))

var praticarTag: Tag = Tag(tagName: "Prática", tagIconColor: UIImage(named: "praticarTag")!, tagIconColorName: "praticarTag", tagIconGrayScale: UIImage(named: "praticarTagPb")!,tagPin:UIImage(named:"praticarPin")!, tagColor: UIColor(colorLiteralRed: 132, green: 183, blue: 34, alpha: 1))



// array local de CulturalActivities
var bancoDeDados: [CulturalActivities] = [CulturalActivities(activitiesName: "Feirinha no CAC", location: CLLocationCoordinate2DMake(-8.050749, -34.9534873), endsAt: "Acaba de 17h", activitieTag: contemplarTag, shortComment: "Barraquinhas com acessórios caseiros", likes: 0, activitieIsVisible: true, activitieExists: true),
  
  CulturalActivities(activitiesName: "Open house party", location:CLLocationCoordinate2DMake(-8.035594, -34.9441419), endsAt: "Acaba de 20h30", activitieTag: celebrarTag, shortComment: "Festa na casa de Mariana, tragam sua cerveja"),
  
  CulturalActivities(activitiesName: "Calourada de arquitetura na concha", location: CLLocationCoordinate2DMake(-8.0525066, -34.9524539), endsAt: "Acaba de 23h", activitieTag: celebrarTag, shortComment: "Kelvis, logo mais"),
  
  CulturalActivities(activitiesName: "Ensaio aberto Touchdown", location: CLLocationCoordinate2DMake(-8.0512811, -34.9542569), endsAt: "Acaba de 17h30", activitieTag: praticarTag, shortComment: "Vamos ensinar coreografias de No Oh Oh (CLC), venham!"),
  
  CulturalActivities(activitiesName: "Horta comunitária", location: CLLocationCoordinate2DMake(-8.0570413, -34.9571922), endsAt: "Acaba de 11h30", activitieTag: colaborarTag, shortComment:"Vamos começar a plantar!"),
  CulturalActivities(activitiesName: "Flash day!", location: CLLocationCoordinate2DMake(-8.0575947, -34.9526536), endsAt: "Acaba de 19h30", activitieTag: contemplarTag, shortComment:"Tattoos da hora!"),
  CulturalActivities(activitiesName: "Aulas de capoeira abertas", location: CLLocationCoordinate2DMake(-8.054750, -34.948663), endsAt: "Acaba de 17h30", activitieTag: praticarTag, shortComment:"Hoje aula com convidados"),
  CulturalActivities(activitiesName: "Oficina de lambe", location: CLLocationCoordinate2DMake(-8.064138, -34.939557), endsAt: "Acaba de 20h30", activitieTag: colaborarTag, shortComment:"Tragam material próprio!")
]
