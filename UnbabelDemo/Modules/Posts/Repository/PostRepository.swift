//
//  PostReopsitory.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 02/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import RxSwift

//Bring all the posts, users and comments to take care of them after, and all the data be available offline
class PostRepository {
  
  class func readPosts() -> Observable<[Post]> {
    let address: String = "http://jsonplaceholder.typicode.com/posts"
    let observable = RestCalls.get(address: address)
    return observable.map({ values in
      var list: [Post] = []
      for value in values {
        if let object = Post.deserialize(from: value as? [String: Any]) {
          list.append(object)
        }
      }
      return list
    })
  }
  
  class func readUsers() -> Observable<[User]> {
    let address: String = "http://jsonplaceholder.typicode.com/users"
    let observable = RestCalls.get(address: address)
    return observable.map({ values in
      var list: [User] = []
      for value in values {
        if let object = User.deserialize(from: value as? [String: Any]) {
          list.append(object)
        }
      }
      return list
    })
  }
  
  class func readComments() -> Observable<[Comment]> {
    let address: String = "http://jsonplaceholder.typicode.com/comments"
    let observable = RestCalls.get(address: address)
    return observable.map({ values in
      var list: [Comment] = []
      for value in values {
        if let object = Comment.deserialize(from: value as? [String: Any]) {
          list.append(object)
        }
      }
      return list
    })
  }
}

