//
//  GroupCollectionViewCell.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {
    
    var groupImage: UIImageView!
    var groupName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func setUpCell() {
        groupName = UILabel()
        groupImage = UIImageView()
        
        contentView.addSubview(groupName)
        contentView.addSubview(groupImage)
        
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupName.textAlignment = .center
        groupName.topAnchor.constraint(equalTo: groupImage.bottomAnchor, constant: 5).isActive = true
        groupName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        groupName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        groupName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        groupImage.translatesAutoresizingMaskIntoConstraints = false
        groupImage.contentMode = .scaleAspectFit
        groupImage.backgroundColor = .systemBlue
        groupImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        groupImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        groupImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        groupImage.bottomAnchor.constraint(equalTo: groupName.topAnchor, constant: -5).isActive = true
    }
    
}
