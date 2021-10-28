//
//  SectionHeader.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/22.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
    let sectionTitle = UILabel()
    static let reuseIdentifier = "SectionHeader"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure() {
        self.backgroundColor = .clear
        addSubview(sectionTitle)
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.adjustsFontForContentSizeCategory = true
        sectionTitle.textColor = .white
        sectionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        sectionTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        sectionTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        sectionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        sectionTitle.font = UIFont.preferredFont(forTextStyle: .title3)
    }
}
