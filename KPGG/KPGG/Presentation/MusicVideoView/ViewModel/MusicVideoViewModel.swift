//
//  MusicVideoViewModel.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/22.
//

import Foundation

protocol MusicVideoViewModelType {
    func youtubeIdReturn() -> String
}

class MusicVideoViewModel: MusicVideoViewModelType {
    
    private var youtubeId: String
    
    init(youtubeId: String) {
        self.youtubeId = youtubeId
    }
    
    func youtubeIdReturn() -> String {
        return youtubeId
    }
    
}
