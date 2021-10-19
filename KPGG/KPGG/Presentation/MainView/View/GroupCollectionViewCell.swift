//
//  GroupCollectionViewCell.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    
    var groupName: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpCell()
    }
    
    func setUpCell() {
        groupName = UILabel()
        contentView.addSubview(groupName)
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupName.textAlignment = .center
        groupName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        groupName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        groupName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        groupName.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5).isActive = true
    }
    
}
