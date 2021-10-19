//
//  ViewModel.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import Foundation

protocol ViewModelType {
    func initiated()
}

class ViewModel: ViewModelType {
    
    init() {
        initiated()
    }
    
    func initiated() {
    }
    
}
