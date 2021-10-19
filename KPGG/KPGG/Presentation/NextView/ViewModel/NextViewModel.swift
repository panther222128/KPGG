//
//  NextViewModel.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import Foundation

protocol NextViewModelType {
    func initiated()
}

class NextViewModel: NextViewModelType {
    
    init() {
        initiated()
    }
    
    func initiated() {
        print("next view model initiated")
    }
    
}
