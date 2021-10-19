//
//  HorizontalScrollableView.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class HorizontalScrollableView: UICollectionView {
    
    private var source: UICollectionViewDiffableDataSource<Section, Group>!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        configureSectionView()
        configureDataSource()
        applyInitialSnapshots()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSectionView()
        configureDataSource()
        applyInitialSnapshots()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section: NSCollectionLayoutSection
            if sectionKind == .first {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.28), heightDimension: .fractionalWidth(0.2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            } else {
                fatalError("Unknown section!")
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func configureSectionView() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.backgroundColor = .systemGroupedBackground
    }
    
    private func createGridCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewCell, Group> {
        return UICollectionView.CellRegistration<UICollectionViewCell, Group> { (cell, indexPath, group) in
            var content = UIListContentConfiguration.cell()
            
            let imageUrl = URL(string: "https://w.namu.la/s/40cc3b00433f49ea71c7750e7fdb29dafd5a1e3a01f3f42e26606d826072f543a125b2a3cda560851c7d6807e413859cf5943a1349f3ab5872a22254210c9d0e9d001030a08e99d46b849434790aabeca3c51b0051161fe8e5adb378a5cebd9a587e1d3065e9bb3f85ea5c6e788a1739")
            do {
                let data = try Data(contentsOf: imageUrl!)
                content.image = UIImage(data: data)
            } catch {
                
            }
            content.text = group.groupname
            content.textProperties.font = .boldSystemFont(ofSize: 38)
            content.textProperties.alignment = .center
            content.directionalLayoutMargins = .zero
            cell.contentConfiguration = content
            var background = UIBackgroundConfiguration.listPlainCell()
            background.cornerRadius = 8
            background.strokeColor = .systemGray3
            background.strokeWidth = 1.0 / cell.traitCollection.displayScale
            cell.backgroundConfiguration = background
        }
    }
    
    private func configureDataSource() {
        let gridCellRegistration = createGridCellRegistration()
        source = UICollectionViewDiffableDataSource<Section, Group>(collectionView: self) {
            (collectionView, indexPath, group) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            switch section {
            case .first:
                return collectionView.dequeueConfiguredReusableCell(using: gridCellRegistration, for: indexPath, item: group)
            }
        }
    }
    
    private func applyInitialSnapshots() {
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, Group>()
        snapshot.appendSections(sections)
        source.apply(snapshot, animatingDifferences: false)
        let groups = [Group(groupname: "1", grouplogo: "4", groupimage: "7", hitsong: "11", haspreviousmember: true),
                      Group(groupname: "2", grouplogo: "5", groupimage: "8", hitsong: "12", haspreviousmember: true),
                      Group(groupname: "3", grouplogo: "6", groupimage: "9", hitsong: "13", haspreviousmember: true),
                      Group(groupname: "123v", grouplogo: "wn346", groupimage: "w4y5m", hitsong: "13", haspreviousmember: true),
                      Group(groupname: "12c3", grouplogo: "n32", groupimage: "2n14", hitsong: "124n12n4", haspreviousmember: true),
                      Group(groupname: "12c31c2", grouplogo: "1b1", groupimage: "43y5wnm", hitsong: "1231bh1bh1", haspreviousmember: true),
                      Group(groupname: "1g", grouplogo: "n124", groupimage: "q34nt", hitsong: "12bb1bn11bn", haspreviousmember: true),
                      Group(groupname: "gg111", grouplogo: "612124", groupimage: "q3n4t", hitsong: "21414g", haspreviousmember: true),
                      Group(groupname: "213y79g", grouplogo: "34n7", groupimage: "q34nt1", hitsong: "1b1b4441", haspreviousmember: true),
                      Group(groupname: "fh8f1hu01", grouplogo: "a2m4t", groupimage: "n14n1n", hitsong: "b1243b11", haspreviousmember: true)]
        var firstSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        firstSnapshot.append(groups)
        source.apply(firstSnapshot, to: .first, animatingDifferences: false)
    }
}
