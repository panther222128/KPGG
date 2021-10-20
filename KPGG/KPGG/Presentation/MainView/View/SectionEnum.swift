//
//  SectionEnum.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/18.
//

import Foundation

enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
    case zero, first, second, third, fourth, fifth, sixth, seventh
    
    var description: String {
        switch self {
        case .zero: return "zero"
        case .first: return "first"
        case .second: return "second"
        case .third: return "third"
        case .fourth: return "fourth"
        case .fifth: return "fifth"
        case .sixth: return "sixth"
        case .seventh: return "seventh"
        }
    }
}
