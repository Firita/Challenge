//
//  PostsViewModel.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 02/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import RxSwift

class PostsViewModel: NSObject {
  private let disposeBag: DisposeBag = DisposeBag()
  var posts: Observable<[Post]>?
  var users: Observable<[User]>!
  var comments: Observable<[Comment]>!
 
  var userId: Variable<Int> = Variable<Int>(0)
  var postId: Variable<Int> = Variable<Int>(0)
  
  var nameAuthor: Observable<String?>!
  var numberComments: Observable<String?>!
  
  override init() {
    super.init()
    getValues()
    observablesCreation()
  }
  
//  Get info from repository
  func getValues(){
    posts = PostRepository.readPosts()
    users = PostRepository.readUsers()
    comments = PostRepository.readComments()
  }
  
//  Create new observables
  func observablesCreation() {
    nameAuthor = Observable.combineLatest(users.asObservable(), userId.asObservable()) { users, id  in
      if users.count > 0 {
        return users.first { $0.id! == id}?.name
      }
      return nil
    }
    
    numberComments = Observable.combineLatest(comments.asObservable(), postId.asObservable()) { comments, id  in
      if comments.count > 0 {
        return comments.filter {$0.postId == id}.count.description
      }
      return nil
    }
  }
}
