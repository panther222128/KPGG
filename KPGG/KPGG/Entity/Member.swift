//
//  Member.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/19.
//

import Foundation

struct MemberResponse: Codable {
    let groupname: [String:[Member]]
}

struct Member: Codable {
    let activityname: String
    let name: String
    let birth: String
    let mbti: String
    let bloodtype: String
    let mainimage: String
    let ispreviousmember: Bool
}
