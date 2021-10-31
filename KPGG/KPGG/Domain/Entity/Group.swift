//
//  Group.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import Foundation

struct GroupResponse: Decodable {
    let group: [String:[Group]]
}

struct Group: Decodable, Hashable {
    let groupname: String
    let grouplogo: String
    let groupimage: String
    let hitsong: String
    let haspreviousmember: Bool
}
