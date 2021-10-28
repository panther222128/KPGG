//
//  ViewModel.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

protocol MainViewModelType {
    func fetch(path: String) -> Observable<[String:[Group]]>
    func configureGroups(_ groups: [String:[Group]])
    func group(sectionName: String) -> [Group]?
    func groupsSubject() -> BehaviorSubject<[String:[Group]]>
}

final class MainViewModel: MainViewModelType {
    
    private let useCase: MainUseCaseType
    private var groups: BehaviorSubject<[String:[Group]]>
    
    init() {
        self.useCase = MainUseCase()
        self.groups = BehaviorSubject<[String:[Group]]>(value: [:])
    }
    
    func fetch(path: String) -> Observable<[String:[Group]]> {
        return useCase.fetchGroupList(path)
    }
    
    func configureGroups(_ groups: [String:[Group]]) {
        self.groups.onNext(groups)
    }
    
    func group(sectionName: String) -> [Group]? {
        do {
            return try groups.value()[sectionName]
        } catch {
            return nil
        }
    }

    func groupsSubject() -> BehaviorSubject<[String:[Group]]> {
        return self.groups
    }
    
}
