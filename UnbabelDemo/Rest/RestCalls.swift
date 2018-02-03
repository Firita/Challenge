//
//  RestCalls.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 02/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import RxSwift

class RestCalls: NSObject {
  
  class func get(address: String) -> Observable<[Any]> {
    var mutableURLRequest: URLRequest = URLRequest(url: URL(string: address)!)
    //Cache to use data offline, we can use other ways to store data, use realm, use userdefaults, coredata... but i dont have more time to do the task
    mutableURLRequest.cachePolicy = .reloadIgnoringLocalCacheData
    let request = Alamofire.request(mutableURLRequest)

    return request.rx.responseJSON()
  }
}

