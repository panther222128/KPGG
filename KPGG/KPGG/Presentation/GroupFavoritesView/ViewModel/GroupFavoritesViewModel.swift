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
    func deleteFavoriteGroup(at index: Int)
    func count() -> Int
    func selectedFavoriteGroup(at index: Int) -> Group?
}

final class GroupFavoritesViewModel: GroupFavoritesViewModelType {
    
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
    
    func selectedFavoriteGroup(at index: Int) -> Group? {
        let selectedGroup = favoritesGroup?[index]
        let group = Group(groupname: selectedGroup?.groupname ?? "", grouplogo: selectedGroup?.grouplogo ?? "", groupimage: selectedGroup?.groupimage ?? "", hitsong: selectedGroup?.hitsong ?? "", haspreviousmember: selectedGroup?.haspreviousmember ?? false)
        return group
    }
    
    func deleteFavoriteGroup(at index: Int) {
        guard let groupFavoritesUseCase = groupFavoritesUseCase else { return }
        groupFavoritesUseCase.deleteGroup(index: index)
    }
    
    func count() -> Int {
        guard let favoritesGroup = favoritesGroup else { return 0 }
        return favoritesGroup.count
    }

}
