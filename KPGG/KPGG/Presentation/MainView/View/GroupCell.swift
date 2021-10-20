//
//  GroupCollectionViewCell.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class GroupCell: UICollectionViewCell {
    
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
        groupImage = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height - 20))
        groupName = UILabel()
        
        contentView.addSubview(groupImage)
        contentView.addSubview(groupName)
        
        groupImage.translatesAutoresizingMaskIntoConstraints = true
        groupImage.backgroundColor = .black
        groupImage.contentMode = .scaleAspectFit
        groupImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        groupImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        groupImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        groupName.translatesAutoresizingMaskIntoConstraints = false
        groupName.textAlignment = .center
        groupName.topAnchor.constraint(equalTo: groupImage.bottomAnchor, constant: 0).isActive = true
        groupName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        groupName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        groupName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
}
