//
//  MainUseCase.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/19.
//

import Foundation
import RxCocoa
import RxSwift

protocol MainUseCaseType {
    func fetchGroupList(_ path: String) -> Observable<[String:[Group]]>
}

class MainUseCase: MainUseCaseType {
    
    var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
   
    func fetchGroupList(_ path: String) -> Observable<[String:[Group]]> {
        return Observable.create { (observer) -> Disposable in
            self.networkService.sendRequest(path: path, type: GroupResponse.self) { (error, groupList) in
                if let error = error {
                    observer.onError(error)
                }
                if let groupList = groupList?.group {
                    observer.onNext(groupList)
                }
                observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }

}
