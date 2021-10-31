//
//  GroupMemberUseCase.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import Foundation
import RxSwift

protocol GroupMemberUseCaseType {
    func fetchMemberList(_ path: String) -> Observable<[String:[Member]]>
    func insertGroup(_ group: Group)
}

final class GroupMemberUseCase: GroupMemberUseCaseType {
    
    var networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
   
    func fetchMemberList(_ path: String) -> Observable<[String:[Member]]> {
        return Observable.create { (observer) -> Disposable in
            self.networkService.sendRequest(path: path, type: MemberResponse.self) { (error, memberList) in
                if let error = error {
                    observer.onError(error)
                }
                if let memberList = memberList?.groupname {
                    observer.onNext(memberList)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    func insertGroup(_ group: Group) {
        FavoritesStorageManager.shared.insertGroup(group: group)
    }

}

