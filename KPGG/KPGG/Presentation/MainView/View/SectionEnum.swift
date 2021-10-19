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
        case .zero: return "Zero"
        case .first: return "First"
        case .second: return "Second"
        case .third: return "Third"
        case .fourth: return "Fourth"
        case .fifth: return "Fifth"
        case .sixth: return "Sixth"
        case .seventh: return "Seventh"
        }
    }
}
