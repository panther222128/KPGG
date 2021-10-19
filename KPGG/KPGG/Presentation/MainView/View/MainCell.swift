//
//  MainCell.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/19.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    var groupImage: UIImageView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpCell()
    }
    
    func setUpCell() {
        groupImage = UIImageView()
        contentView.addSubview(groupImage)
        groupImage.translatesAutoresizingMaskIntoConstraints = false
        groupImage.contentMode = .scaleAspectFill
        groupImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        groupImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        groupImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        groupImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
