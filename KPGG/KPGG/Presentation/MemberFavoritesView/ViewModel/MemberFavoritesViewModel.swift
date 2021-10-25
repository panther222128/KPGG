//
//  MemberFavoritesViewModel.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation

protocol MemberFavoritesViewModelType {
    func fetch()
    func favorites() -> [MemberInfo]?
    func deleteMember(index: Int)
    func count() -> Int
    func selectedMember(index: Int) -> Member?
}

class MemberFavoritesViewModel: MemberFavoritesViewModelType {
    
    private var memberFavoritesUseCase: MemberFavoritesUseCaseType?
    private var favoritesMember: [MemberInfo]?
    
    init() {
        self.memberFavoritesUseCase = MemberFavoritesUseCase()
    }
    
    func fetch() {
        guard let memberFavoritesUseCase = memberFavoritesUseCase else { return }
        favoritesMember = memberFavoritesUseCase.fetchFavoritesMember()
    }
    
    func favorites() -> [MemberInfo]? {
        return favoritesMember
    }
    
    func selectedMember(index: Int) -> Member? {
        let selectedMember = favoritesMember?[index]
        let member = Member(activityname: selectedMember?.activityname ?? "", name: selectedMember?.name ?? "", birth: selectedMember?.birth ?? "", mbti: selectedMember?.mbti ?? "", bloodtype: selectedMember?.bloodtype ?? "", mainimage: selectedMember?.mainimage ?? "", ispreviousmember: selectedMember?.ispreviousmember ?? false)
        return member
    }
    
    func deleteMember(index: Int) {
        guard let memberFavoritesUseCase = memberFavoritesUseCase else { return }
        memberFavoritesUseCase.deleteMember(index: index)
    }
    
    func count() -> Int {
        guard let favoritesMember = favoritesMember else { return 0 }
        return favoritesMember.count
    }
    
}
