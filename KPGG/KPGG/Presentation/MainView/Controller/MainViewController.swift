//
//  ViewController.swift
//  GG
//
//  Created by Jun Ho JANG on 2021/10/17.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var section: UICollectionView!
    
    private var mainViewModel: MainViewModelType?
    private var source: UICollectionViewDiffableDataSource<Section, Group>!
    private var disposeBag = DisposeBag()
    
    static let sectionHeaderElementKind = "SectionHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showMainViewController(with: MainViewModel())
        fetchGroups(path: "")
        configureHierarchy()
        setupDiffableDataSource()
        section.delegate = self
        subscribe()
        configureNavigation()
    }
    
    private func subscribe()  {
        self.mainViewModel?.groupsSubject().subscribe(onNext:{ [weak self] _ in
            self?.applySectionSnaphots()
            self?.section.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func fetchGroups(path: String) {
        self.mainViewModel?.fetch(path: path).subscribe { [weak self] members in
            self?.mainViewModel?.configureGroups(members)
        } onError: { [weak self] error in
            let error = error.localizedDescription
            self?.makeErrorAlert(error: error)
        }.disposed(by: disposeBag)
    }
    
    private func makeErrorAlert(error: String) {
        let alert = UIAlertController(title: "네트워크 에러", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
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
            switch sectionKind {
            case .zero:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 0
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.35))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(35)),elementKind: MainViewController.sectionHeaderElementKind, alignment: .top)
                sectionHeader.pinToVisibleBounds = true
                sectionHeader.zIndex = 2
                section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [sectionHeader]
                section.interGroupSpacing = 2
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10)
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func setupDiffableDataSource() {
        let headerRegistration = UICollectionView.SupplementaryRegistration <SectionHeader>(elementKind: MainViewController.sectionHeaderElementKind) { supplementaryView, string, indexPath in
            if indexPath == [1, 0] {
                supplementaryView.sectionTitle.text = "2020년 데뷔"
            } else if indexPath == [2, 0] {
                supplementaryView.sectionTitle.text = "2016~2019년 데뷔"
            } else if indexPath == [3, 0] {
                supplementaryView.sectionTitle.text = "2014~2015년 데뷔"
            } else if indexPath == [4, 0] {
                supplementaryView.sectionTitle.text = "2012~2013년 데뷔"
            } else if indexPath == [5, 0] {
                supplementaryView.sectionTitle.text = "2010~2011년 데뷔"
            } else if indexPath == [6, 0] {
                supplementaryView.sectionTitle.text = "2009년 데뷔"
            } else if indexPath == [7, 0] {
                supplementaryView.sectionTitle.text = "2006~2008년 데뷔"
            }
        }
        
        let mainCellRegistration = UICollectionView.CellRegistration<MainCell, Group> { cell, indexPath, group in
            let imageUrl = URL(string: group.groupimage)
            var data = Data()
            do {
                data = try Data(contentsOf: imageUrl!)
            } catch {
                
            }
            cell.groupImage.image = UIImage(data: data)
            var background = UIBackgroundConfiguration.listPlainCell()
            background.cornerRadius = 0
            background.backgroundColor = .black
            cell.backgroundConfiguration = background
        }
        
        let cellRegistration = UICollectionView.CellRegistration<GroupCell, Group> { cell, indexPath, group in
            let imageUrl = URL(string: group.groupimage)
            var data = Data()
            do {
                data = try Data(contentsOf: imageUrl!)
                cell.groupImage.image = UIImage(data: data)
            } catch {
                
            }
            cell.groupName.text = group.groupname
            var background = UIBackgroundConfiguration.listPlainCell()
            background.cornerRadius = 8
            background.backgroundColor = .black
            cell.backgroundConfiguration = background
        }
        
        source = UICollectionViewDiffableDataSource<Section, Group>(collectionView: section) {
            (collectionView, indexPath, group) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            switch section {
            case .zero:
                return collectionView.dequeueConfiguredReusableCell(using: mainCellRegistration, for: indexPath, item: group)
            default:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: group)
            }
        }
        
        source.supplementaryViewProvider = { (view, kind, index) in
            return self.section.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: index)
        }
        
    }
    
    private func applySectionSnaphots() {
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.zero.description) {
            guard let selectedGroup = selectedGroupList.shuffled().first else { return }
            var zeroSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            zeroSnapShot.append([selectedGroup])
            source.apply(zeroSnapShot, to: .zero, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.first.description) {
            var firstSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            firstSnapShot.append(selectedGroupList)
            source.apply(firstSnapShot, to: .first, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.second.description) {
            var secondSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            secondSnapShot.append(selectedGroupList)
            source.apply(secondSnapShot, to: .second, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.third.description) {
            var thirdSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            thirdSnapShot.append(selectedGroupList)
            source.apply(thirdSnapShot, to: .third, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.fourth.description) {
            var fourthSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            fourthSnapShot.append(selectedGroupList)
            source.apply(fourthSnapShot, to: .fourth, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.fifth.description) {
            var fifthSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            fifthSnapShot.append(selectedGroupList)
            source.apply(fifthSnapShot, to: .fifth, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.sixth.description) {
            var sixthSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            sixthSnapShot.append(selectedGroupList)
            source.apply(sixthSnapShot, to: .sixth, animatingDifferences: false)
        }
        if let selectedGroupList = self.mainViewModel?.group(sectionName: Section.seventh.description) {
            var seventhSnapShot = NSDiffableDataSourceSectionSnapshot<Group>()
            seventhSnapShot.append(selectedGroupList)
            source.apply(seventhSnapShot, to: .seventh, animatingDifferences: false)
        }
    }
    
    private func configureNavigation() {
        self.navigationItem.backButtonTitle = "   "
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.setStatusBar(backgroundColor: .clear)

        if #available(iOS 11.0, *) {
            self.section.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem?.tintColor = .blue
    }
    
    func showMainViewController(with viewModel: MainViewModelType) {
        self.mainViewModel = viewModel
    }
    
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let groupName = self.source.itemIdentifier(for: indexPath)?.groupname else {
            section.deselectItem(at: indexPath, animated: true)
            return
        }
        guard let groupHitSong = self.source.itemIdentifier(for: indexPath)?.hitsong else {
            section.deselectItem(at: indexPath, animated: true)
            return
        }
        guard let groupMemberViewController = self.storyboard?.instantiateViewController(withIdentifier: "GroupMember") as? GroupMemberViewController else { return }
        groupMemberViewController.showGroupMemberViewController(with: GroupMemberViewModel(groupName: groupName, groupHitSong: groupHitSong))
        self.navigationController?.pushViewController(groupMemberViewController, animated: true)
    }
    
}
