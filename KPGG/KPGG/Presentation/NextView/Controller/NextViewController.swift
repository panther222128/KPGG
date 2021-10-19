//
//  NextViewController.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class NextViewController: UIViewController {
    
    private var nextViewModel: NextViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showNextViewController(with nextViewModel: NextViewModelType) {
        self.nextViewModel = nextViewModel
    }
}
