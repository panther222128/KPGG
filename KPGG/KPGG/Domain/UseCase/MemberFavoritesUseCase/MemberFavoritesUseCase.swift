//
//  MemberFavoritesUseCase.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation
import CoreData

protocol MemberFavoritesUseCaseType {
    func fetchFavoritesMember() -> [MemberInfo]
    func deleteMember(index: Int)
}

final class MemberFavoritesUseCase: MemberFavoritesUseCaseType {

    func fetchFavoritesMember() -> [MemberInfo] {
        let request: NSFetchRequest<MemberInfo> = MemberInfo.fetchRequest()
        let fetchResult = FavoritesStorageManager.shared.fetch(request: request)
        return fetchResult
    }
    
    func deleteMember(index: Int) {
        let request: NSFetchRequest<MemberInfo> = MemberInfo.fetchRequest()
        let fetchResult = FavoritesStorageManager.shared.fetch(request: request)
        FavoritesStorageManager.shared.delete(object: fetchResult[index])
    }
}
