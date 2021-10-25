//
//  GroupFavoritesViewModel.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation

protocol GroupFavoritesViewModelType {
    func fetch()
    func favorites() -> [GroupInfo]?
    func deleteGroup(index: Int)
    func count() -> Int
}

class GroupFavoritesViewModel: GroupFavoritesViewModelType {
    
    private var groupFavoritesUseCase: GroupFavoritesUseCaseType?
    private var favoritesGroup: [GroupInfo]?
    
    init() {
        self.groupFavoritesUseCase = GroupFavoritesUseCase()
    }
    
    func fetch() {
        guard let groupFavoritesUseCase = groupFavoritesUseCase else { return }
        favoritesGroup = groupFavoritesUseCase.fetchFavoritesGroup()
    }
    
    func favorites() -> [GroupInfo]? {
        return favoritesGroup
    }
    
    func deleteGroup(index: Int) {
        guard let groupFavoritesUseCase = groupFavoritesUseCase else { return }
        groupFavoritesUseCase.deleteGroup(index: index)
    }
    
    func count() -> Int {
        guard let favoritesGroup = favoritesGroup else { return 0 }
        return favoritesGroup.count
    }

}
