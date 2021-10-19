//
//  ViewController.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var section: UICollectionView!
    
    private var viewModel: ViewModelType?
    private var source: UICollectionViewDiffableDataSource<Section, Group>!
    private var secondSource: UICollectionViewDiffableDataSource<Section, Group>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showMainViewController(with: ViewModel())
        configureHierarchy()
        setupDiffableDataSource()
        applyInitialSnapshots()
    }
    
    private func configureHierarchy() {
        section.collectionViewLayout = createLayout()
        section.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        section.backgroundColor = .black
        self.view.backgroundColor = .black
    }
    
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section: NSCollectionLayoutSection
            if sectionKind == .zero {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 0
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            } else if sectionKind == .first {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else if sectionKind == .second {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else if sectionKind == .third {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else if sectionKind == .fourth {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else if sectionKind == .fifth {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else if sectionKind == .sixth {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else if sectionKind == .seventh {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            } else {
                fatalError("Unknown section!")
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func setupDiffableDataSource() {
         
        let cellRegistration = UICollectionView.CellRegistration<GroupCollectionViewCell, Group> { cell, indexPath, item in
            cell.groupName.text = item.groupname
            cell.groupName.textColor = .white
            var background = UIBackgroundConfiguration.listPlainCell()
            background.cornerRadius = 8
            background.backgroundColor = .black
            cell.backgroundConfiguration = background
        }
        source = UICollectionViewDiffableDataSource(collectionView: section) { section, indexPath, item in
            return section.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
    }

    private func applyInitialSnapshots() {
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, Group>()
        snapshot.appendSections(sections)
        source.apply(snapshot, animatingDifferences: false)
        
        let zeroGroups = [Group(groupname: "12c3123", grouplogo: "4", groupimage: "7", hitsong: "11", haspreviousmember: true)]
        var zeroSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        zeroSnapshot.append(zeroGroups)
        source.apply(zeroSnapshot, to: .zero, animatingDifferences: false)
        
        let firstGroups = [Group(groupname: "1", grouplogo: "4", groupimage: "7", hitsong: "11", haspreviousmember: true)]
        var firstSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        firstSnapshot.append(firstGroups)
        source.apply(firstSnapshot, to: .first, animatingDifferences: false)
        
        let secondGroups = [Group(groupname: "8", grouplogo: "1bh23", groupimage: "n1", hitsong: "3f1231", haspreviousmember: true),
                            Group(groupname: "9", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true)]
        var secondSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        secondSnapshot.append(secondGroups)
        source.apply(secondSnapshot, to: .second, animatingDifferences: false)
        
        let thirdGroups = [Group(groupname: "15", grouplogo: "1bh23", groupimage: "n1", hitsong: "3f1231", haspreviousmember: true),
                            Group(groupname: "16", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "12bh31j2n", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true)]
        var thirdSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        thirdSnapshot.append(thirdGroups)
        source.apply(thirdSnapshot, to: .third, animatingDifferences: false)
        
        let fourthGroups = [Group(groupname: "17", grouplogo: "1bh23", groupimage: "n1", hitsong: "3f1231", haspreviousmember: true),
                            Group(groupname: "18", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                            Group(groupname: "19", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                            Group(groupname: "20", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true)]
        var fourthSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        fourthSnapshot.append(fourthGroups)
        source.apply(fourthSnapshot, to: .fourth, animatingDifferences: false)
        
        let fifthGroups = [Group(groupname: "21", grouplogo: "1bh23", groupimage: "n1", hitsong: "3f1231", haspreviousmember: true),
                            Group(groupname: "22", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "23", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "24", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "25", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true)]
        var fifthSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        fifthSnapshot.append(fifthGroups)
        source.apply(fifthSnapshot, to: .fifth, animatingDifferences: false)
        
        let sixthGroups = [Group(groupname: "26", grouplogo: "1bh23", groupimage: "n1", hitsong: "3f1231", haspreviousmember: true),
                            Group(groupname: "27", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "28", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "29", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "30", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                           Group(groupname: "31", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true)]
        var sixthSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        sixthSnapshot.append(sixthGroups)
        source.apply(sixthSnapshot, to: .sixth, animatingDifferences: false)
        
        let seventhGroups = [Group(groupname: "32", grouplogo: "1bh23", groupimage: "n1", hitsong: "3f1231", haspreviousmember: true),
                            Group(groupname: "33", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                             Group(groupname: "34", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                             Group(groupname: "35", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                             Group(groupname: "37", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                             Group(groupname: "38", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true),
                             Group(groupname: "39", grouplogo: "6ggg", groupimage: "9", hitsong: "13", haspreviousmember: true)]
        var seventhSnapshot = NSDiffableDataSourceSectionSnapshot<Group>()
        seventhSnapshot.append(seventhGroups)
        source.apply(seventhSnapshot, to: .seventh, animatingDifferences: false)
        
    }
    
    
    func showMainViewController(with viewModel: ViewModelType) {
        self.viewModel = viewModel
    }
    
}
