//
//  MemberDetailViewModel.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import Foundation

protocol MemberDetailViewModelType {
    func activityName() -> String
    func name() -> String
    func birth() -> String
    func mbti() -> String
    func bloodType() -> String
    func mainImage() -> String
    func isPreviousMember() -> String
    func insertAtFavoritesMember(member: Member)
    func selectedMember() -> Member
}

final class MemberDetailViewModel: MemberDetailViewModelType {
    
    private var memberDetailUseCase: MemberDetailUseCaseType
    private var member: Member?
    
    init(member: Member) {
        self.member = member
        self.memberDetailUseCase = MemberDetailUseCase()
    }
    
    func activityName() -> String {
        guard let member = member else {
            return ""
        }
        return member.activityname
    }
    
    func name() -> String {
        guard let member = member else {
            return ""
        }
        return member.name
    }
    
    func birth() -> String {
        guard let member = member else {
            return ""
        }
        return member.birth
    }
    
    func mbti() -> String {
        guard let member = member else {
            return ""
        }
        return member.mbti
    }
    
    func bloodType() -> String {
        guard let member = member else {
            return ""
        }
        return member.bloodtype
    }
    
    func mainImage() -> String {
        guard let member = member else {
            return ""
        }
        return member.mainimage
    }
    
    func isPreviousMember() -> String {
        guard let member = member else {
            return ""
        }
        if member.ispreviousmember {
            return "탈퇴"
        } else {
            return "활동"
        }
    }
    
    func selectedMember() -> Member {
        guard let member = member else { return Member(activityname: "", name: "", birth: "", mbti: "", bloodtype: "", mainimage: "", ispreviousmember: false) }
        return member
    }
    
    func insertAtFavoritesMember(member: Member) {
        memberDetailUseCase.insertMember(member: member)
    }
    
}
