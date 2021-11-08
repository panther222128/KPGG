//
//  GroupFavoritesViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit

final class GroupFavoritesViewController: UIViewController {
    
    @IBOutlet weak var groupFavoritesView: UITableView!
    
    private var groupFavoritesViewModel: GroupFavoritesViewModelType?
    private var groupFavoritesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showGroupFavoritesViewController(with: GroupFavoritesViewModel())
        fetchGroupFavorites()
        groupFavoritesView.dataSource = self
        groupFavoritesView.delegate = self
        groupFavoritesView.prefetchDataSource = self
        configureGroupFavoritesView()
        configureNavigation()
        groupFavoritesView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchGroupFavorites()
        setGroupFavoritesCount()
        groupFavoritesView.reloadData()
    }
    
    private func setGroupFavoritesCount() {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return }
        self.groupFavoritesCount = groupFavoritesViewModel.count()
    }
    
    private func fetchGroupFavorites() {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return }
        groupFavoritesViewModel.fetch()
    }
    
    private func configureGroupFavoritesView() {
        self.groupFavoritesView.backgroundColor = .black
    }
    
    private func configureNavigation() {
        self.navigationItem.backButtonTitle = "   "
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.setStatusBar(backgroundColor: .black)
        if #available(iOS 11.0, *) {
            self.groupFavoritesView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationItem.backBarButtonItem?.tintColor = .blue
    }
    
    func showGroupFavoritesViewController(with viewModel: GroupFavoritesViewModelType) {
        self.groupFavoritesViewModel = viewModel
    }
    
}

extension GroupFavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return 0 }
        return groupFavoritesViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return UITableViewCell() }
        guard let cell = groupFavoritesView.dequeueReusableCell(withIdentifier: "GroupFavoritesCell", for: indexPath) as? GroupFavoritesCell else { return UITableViewCell() }
        guard let groupname = groupFavoritesViewModel.favorites()?[indexPath.row].groupname else { return UITableViewCell() }
        guard let imageUrl = URL(string: groupFavoritesViewModel.favorites()?[indexPath.row].groupimage ?? "") else { return UITableViewCell() }
        cell.configureCell(imageUrl: imageUrl, groupName: groupname)
        return cell
    }
    
}

extension GroupFavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupMemberViewController = self.storyboard?.instantiateViewController(withIdentifier: "GroupMember") as? GroupMemberViewController else { return }
        guard let group = self.groupFavoritesViewModel?.selectedFavoriteGroup(at: indexPath.row) else { return }
        groupMemberViewController.showGroupMemberViewController(with: GroupMemberViewModel(with: group.groupname, with: group.hitsong, with: group))
        self.navigationController?.pushViewController(groupMemberViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return UISwipeActionsConfiguration() }
        let delete = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            groupFavoritesViewModel.deleteFavoriteGroup(at: indexPath.row)
            self.fetchGroupFavorites()
            self.groupFavoritesView.reloadData()
            if self.groupFavoritesCount - 1 == groupFavoritesViewModel.count() {
                let addSuccessAlert = UIAlertController(title: "삭제하기", message: "정상적으로 삭제되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let addSuccessAlertAction = UIAlertAction(title: "OK", style: .default) { action in
                    self.navigationController?.popViewController(animated: true)
                }
                addSuccessAlert.addAction(addSuccessAlertAction)
                self.groupFavoritesCount -= 1
                self.present(addSuccessAlert, animated: true, completion: nil)
            } else {
                let addSuccessAlert = UIAlertController(title: "삭제하기", message: "그룹이 삭제되지 않았습니다.", preferredStyle: UIAlertController.Style.alert)
                let addSuccessAlertAction = UIAlertAction(title: "뒤로가기", style: .destructive)
                addSuccessAlert.addAction(addSuccessAlertAction)
                self.present(addSuccessAlert, animated: true, completion: nil)
            }
            success(true)
        }
        delete.backgroundColor = .systemPink
        return UISwipeActionsConfiguration(actions:[delete])
    }
    
}

extension GroupFavoritesViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard let groupFavoritesViewModel = groupFavoritesViewModel else { return }
            guard let cell = groupFavoritesView.dequeueReusableCell(withIdentifier: "GroupFavoritesCell", for: indexPath) as? GroupFavoritesCell else { return }
            guard let groupname = groupFavoritesViewModel.favorites()?[indexPath.row].groupname else { return }
            guard let imageUrl = URL(string: groupFavoritesViewModel.favorites()?[indexPath.row].groupimage ?? "") else { return }
            cell.configureCell(imageUrl: imageUrl, groupName: groupname)
        }
    }
    
}
