//
//  GroupSectionStackView.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class GroupSectionStackView: UIStackView {
    
    private var data = ["a", "b", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "c", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d", "d"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCollectionView()
        configure()
        addSubView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        registerCollectionView()
        configure()
        addSubView()
    }
    
    private func configure() {
        self.spacing = 0
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
    }
    
    let customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    private func registerCollectionView() {
        customCollectionView.register(GroupCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
    }
    
    private func addSubView() {
        customCollectionView.translatesAutoresizingMaskIntoConstraints = false
        customCollectionView.backgroundColor = .white
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        self.addArrangedSubview(customCollectionView)
    }
    
}

extension GroupSectionStackView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = customCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GroupCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.memberNameLabel.text = data[indexPath.row]
        return cell
    }
}
