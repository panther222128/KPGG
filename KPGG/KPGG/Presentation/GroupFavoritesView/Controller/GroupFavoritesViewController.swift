//
//  GroupFavoritesViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit

class GroupFavoritesViewController: UIViewController {
    
    @IBOutlet weak var groupFavoritesView: UITableView!
    
    private var groupFavoritesViewModel: GroupFavoritesViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showGroupFavoritesViewController(with: GroupFavoritesViewModel())
        fetchGroupFavorites()
        groupFavoritesView.dataSource = self
        groupFavoritesView.delegate = self
        configureGroupFavoritesView()
        configureNavigation()
        groupFavoritesView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchGroupFavorites()
        groupFavoritesView.reloadData()
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
        guard let group = self.groupFavoritesViewModel?.selectedGroup(index: indexPath.row) else { return }
        groupMemberViewController.showGroupMemberViewController(with: GroupMemberViewModel(groupName: group.groupname, groupHitSong: group.hitsong, group: group), buttonHidden: true)
        self.navigationController?.pushViewController(groupMemberViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return UISwipeActionsConfiguration() }
        let delete = UIContextualAction(style: .normal, title: "삭제") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            groupFavoritesViewModel.deleteGroup(index: indexPath.row)
            self.fetchGroupFavorites()
            self.groupFavoritesView.reloadData()
            success(true)
        }
        delete.backgroundColor = .systemPink
        return UISwipeActionsConfiguration(actions:[delete])
    }
    
}
