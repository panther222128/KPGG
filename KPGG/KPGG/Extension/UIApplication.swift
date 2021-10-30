//
//  UIApplication.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/30.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
