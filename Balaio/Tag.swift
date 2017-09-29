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
  var tagIconGrayScale: UIImage
  var tagDescription: String = ""
  
  // init com a descrição
  init (tagName: String, tagIconColor: UIImage, tagIconGrayScale: UIImage, tagDescription: String) {
    self.tagName = tagName
    self.tagIconColor = tagIconColor
    self.tagIconGrayScale = tagIconGrayScale
    self.tagDescription = tagDescription
  }
  
  // init sem a descrição (ela é um string vazio)
  init (tagName: String, tagIconColor: UIImage, tagIconGrayScale: UIImage) {
    self.tagName = tagName
    self.tagIconColor = tagIconColor
    self.tagIconGrayScale = tagIconGrayScale
  }
}
