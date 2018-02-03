//
//  ViewController.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 02/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PostsViewController: UIViewController {
  private let viewModel: PostsViewModel = PostsViewModel()
  private let disposeBag: DisposeBag = DisposeBag()
  private let cellIdentifier = "PostCell"
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    bindings()
  }
  
  func bindings() {
    viewModel.posts?.bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) {
      (index, post: Post, cell: PostCell) in
      cell.postTitle.text = post.title
      cell.post = post
      }
      .disposed(by: disposeBag)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let postDetails: PostDetailsViewController = segue.destination as? PostDetailsViewController {
      if let cell: PostCell = sender as? PostCell {
        viewModel.postId.value = cell.post.id!
        viewModel.userId.value = cell.post.userId!
        postDetails.viewModel = viewModel
        postDetails.post = cell.post
      }
    }
  }
}

extension PostsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}

