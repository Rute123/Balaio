//
//  Tag.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/28/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import Foundation
import UIKit

// Classe pra as tags (ícones), com um nome, o ícone, ícone em escala de cinza (e a descrição do ícone pra fazer a página de informação se der tempo)
class Tag {
  var tagName: String
  var tagIconColor: UIImage
  var tagIconColorName: String
  var tagIconGrayScale: UIImage
  var tagDescription: String = ""
  var tagPin: UIImage
  var tagColor: UIColor
  
  // init com a descrição
  init (tagName: String, tagIconColor: UIImage, tagIconColorName: String, tagIconGrayScale: UIImage, tagDescription: String, tagPin:UIImage, tagColor: UIColor) {
    self.tagName = tagName
    self.tagIconColor = tagIconColor
    self.tagIconColorName = tagIconColorName
    self.tagIconGrayScale = tagIconGrayScale
    self.tagDescription = tagDescription
    self.tagPin = tagPin
    self.tagColor = tagColor
  }
  
  // init sem a descrição (ela é um string vazio)
  init (tagName: String, tagIconColor: UIImage, tagIconColorName: String, tagIconGrayScale: UIImage, tagPin:UIImage, tagColor: UIColor) {
    self.tagName = tagName
    self.tagIconColor = tagIconColor
    self.tagIconColorName = tagIconColorName
    self.tagIconGrayScale = tagIconGrayScale
    self.tagPin = tagPin
    self.tagColor = tagColor
  }
}
