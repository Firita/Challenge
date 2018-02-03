//
//  Reactive+Extension.swift
//  UnbabelDemo
//
//  Created by Silvia Santos on 02/02/18.
//  Copyright © 2018 Silvia Santos. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

extension Request: ReactiveCompatible {}

extension Reactive where Base: DataRequest {
  
  func responseJSON() -> Observable<[Any]> {
    return Observable.create { observer in
      let request = self.base.responseJSON { response in
        switch response.result {
        case .success(let value):
          if let value = value as? [Any] {
            observer.onNext(value)
          } else {
            observer.onNext([])
          }
          observer.onCompleted()
        case .failure(_):
          //Return [] if there is no connection and no data o send
          //observer.onError(error)
          observer.onNext([])
        }
      }
      return Disposables.create(with: request.cancel)
    }
  }

}
