//
//  GroupFavoritesUseCase.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation
import CoreData

protocol GroupFavoritesUseCaseType {
    func fetchFavoritesGroup() -> [GroupInfo]
    func deleteGroup(index: Int)
}

class GroupFavoritesUseCase: GroupFavoritesUseCaseType {

    func fetchFavoritesGroup() -> [GroupInfo] {
        let request: NSFetchRequest<GroupInfo> = GroupInfo.fetchRequest()
        let fetchResult = FavoritesStorageManager.shared.fetch(request: request)
        return fetchResult
    }
    
    func deleteGroup(index: Int) {
        let request: NSFetchRequest<GroupInfo> = GroupInfo.fetchRequest()
        let fetchResult = FavoritesStorageManager.shared.fetch(request: request)
        FavoritesStorageManager.shared.delete(object: fetchResult[index])
    }
}
