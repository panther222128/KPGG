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
}

class MemberDetailViewModel: MemberDetailViewModelType {
    
    private var member: Member?
    
    init(member: Member) {
        self.member = member
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
    
}
