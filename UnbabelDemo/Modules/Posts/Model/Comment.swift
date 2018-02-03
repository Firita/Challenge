//
//  Comment.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 03/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import HandyJSON

class Comment: HandyJSON {
  var postId: Int?
  var id: Int?
  var name: String?
  var email: String?
  var body: String?

  required init() {}
}
