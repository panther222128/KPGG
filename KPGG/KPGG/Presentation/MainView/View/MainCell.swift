//
//  MainCell.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/19.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    var groupImage: UIImageView!
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
        groupImage = UIImageView()
        groupName = UILabel()
        contentView.addSubview(groupImage)
        contentView.addSubview(groupName)
        
        groupImage.translatesAutoresizingMaskIntoConstraints = false
        groupImage.contentMode = .scaleAspectFit
        groupImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        groupImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        groupImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        groupImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupName.textAlignment = .left
        groupName.textColor = .white
        groupName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        groupName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        groupName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
}
