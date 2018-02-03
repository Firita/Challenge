//
//  Post.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 02/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import HandyJSON

class Post: HandyJSON {
  var userId: Int?
  var id: Int?
  var title: String?
  var body: String?
  
  required init() {}
}


