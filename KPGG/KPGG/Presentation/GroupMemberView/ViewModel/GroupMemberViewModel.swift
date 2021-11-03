//
//  GroupMemberViewModel.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import Foundation
import RxSwift
import CoreData

protocol GroupMemberViewModelType {
    func fetch() -> Observable<[String:[Member]]>
    func configureMembers(_ members: [String:[Member]])
    func member() -> [Member]?
    func membersCount() -> Int?
    func membersSubject() -> BehaviorSubject<[String:[Member]]>
    func groupNameReturn() -> String
    func groupHitSongReturn() -> String
    func selectedGroup() -> Group
    func insertAtFavoritesGroup(_ group: Group)
    func isGroupFavoritesContains() -> Bool
}

final class GroupMemberViewModel: GroupMemberViewModelType {

    private let useCase: GroupMemberUseCaseType
    private var members: BehaviorSubject<[String:[Member]]>
    private var groupName: String
    private var groupHitSong: String
    private var group: Group?
    private var favorites: [GroupInfo]?
    
    init(with groupName: String, with groupHitSong: String, with group: Group) {
        self.useCase = GroupMemberUseCase()
        self.members = BehaviorSubject<[String:[Member]]>(value: [:])
        self.groupName = groupName
        self.groupHitSong = groupHitSong
        self.group = group
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
    
    func groupNameReturn() -> String {
        return self.groupName
    }
    
    func groupHitSongReturn() -> String {
        return self.groupHitSong
    }
    
    func selectedGroup() -> Group {
        guard let group = group else { return Group(groupname: "", grouplogo: "", groupimage: "", hitsong: "", haspreviousmember: false) }
        return group
    }
    
    func insertAtFavoritesGroup(_ group: Group) {
        useCase.insertGroup(group)
    }
    
    func isGroupFavoritesContains() -> Bool {
        let request: NSFetchRequest<GroupInfo> = GroupInfo.fetchRequest()
        guard let groupname = group?.groupname else { return false }
        request.predicate = NSPredicate(format: "groupname == %@", groupname)
        let fetchResult = FavoritesStorageManager.shared.fetch(request: request)
        if fetchResult.count >= 1 {
            return true
        } else {
            return false
        }
    }
    
}

