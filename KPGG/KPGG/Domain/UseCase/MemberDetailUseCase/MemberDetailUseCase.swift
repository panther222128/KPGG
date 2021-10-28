//
//  MemberDetailUseCase.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import Foundation

protocol MemberDetailUseCaseType {
    func insertMember(member: Member)
}

final class MemberDetailUseCase: MemberDetailUseCaseType {
    
    func insertMember(member: Member) {
        FavoritesStorageManager.shared.insertMember(member: member)
    }
    
}
