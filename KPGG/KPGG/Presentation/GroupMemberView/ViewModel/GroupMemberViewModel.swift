//
//  GroupMemberViewModel.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import Foundation
import RxCocoa
import RxSwift

protocol GroupMemberViewModelType {
    func fetch() -> Observable<[String:[Member]]>
    func configureMembers(_ members: [String:[Member]])
    func member() -> [Member]?
    func membersCount() -> Int?
    func membersSubject() -> BehaviorSubject<[String:[Member]]>
}

class GroupMemberViewModel: GroupMemberViewModelType {
    
    private let useCase: GroupMemberUseCaseType
    private var members: BehaviorSubject<[String:[Member]]>
    private var groupName: String
    
    init(groupName: String) {
        self.useCase = GroupMemberUseCase()
        self.members = BehaviorSubject<[String:[Member]]>(value: [:])
        self.groupName = groupName
    }
    
    func fetch() -> Observable<[String:[Member]]> {
        return useCase.fetchMemberList(groupName)
    }
    
    func configureMembers(_ members: [String:[Member]]) {
        self.members.onNext(members)
    }
    
    func member() -> [Member]? {
        do {
            return try members.value()[groupName]
        } catch {
            return nil
        }
    }
    
    func membersCount() -> Int? {
        do {
            return try self.members.value()[groupName]?.count
        } catch {
            return nil
        }
    }
    
    func membersSubject() -> BehaviorSubject<[String:[Member]]> {
        return self.members
    }
    
}
