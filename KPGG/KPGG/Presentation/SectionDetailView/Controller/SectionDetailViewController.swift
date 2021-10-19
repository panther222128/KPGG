//
//  NextViewController.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class SectionDetailViewController: UIViewController {
    
    private var sectionDetailViewModel: SectionDetailViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showNextViewController(with sectionDetailViewModel: SectionDetailViewModelType) {
        self.sectionDetailViewModel = sectionDetailViewModel
    }
}
