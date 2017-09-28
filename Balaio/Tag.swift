//
//  Tag.swift
//  Balaio
//
//  Created by Camila Simões Marques Wanderley on 9/28/17.
//  Copyright © 2017 Camila Simões Marques Wanderley. All rights reserved.
//

import Foundation
import UIKit

// Classe pra as tags (ícones), com um nome, o ícone e o ícone em escala de cinza
class Tag {
  var tagName: String
  var tagIconColor: UIImageView
  var tagIconGrayScale: UIImageView
  
  init (tagName: String, tagIconColor: UIImageView, tagIconGrayScale: UIImageView) {
    self.tagName = tagName
    self.tagIconColor = tagIconColor
    self.tagIconGrayScale = tagIconGrayScale
  }
}
