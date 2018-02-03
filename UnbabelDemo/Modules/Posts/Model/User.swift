//
//  User.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 03/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import HandyJSON

class User: HandyJSON {
  var id: Int?
  var name: String?
  var username: String?
  var email: String?
  var address: Address?
  
  required init() {}
}

class Address: HandyJSON {
  var street: String?
  var suite: String?
  var city: String?
  var zipcode: String?
  var geo: (lat: String?, lng: String?)?
  
  required init() {}
}

