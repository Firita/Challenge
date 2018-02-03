//
//  PostDetailsViewController.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 03/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PostDetailsViewController: UIViewController {
  var viewModel: PostsViewModel!
  private let disposeBag: DisposeBag = DisposeBag()
  var post: Post!
  
  @IBOutlet weak var author: UILabel!
  @IBOutlet weak var numberComments: UILabel!
  @IBOutlet weak var body: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    body.text = post.body
    binding()
  }
  
  func binding() {
    viewModel.nameAuthor.bind(to: author.rx.text).disposed(by: disposeBag)
    viewModel.numberComments.bind(to: numberComments.rx.text).disposed(by: disposeBag)
  }
}
