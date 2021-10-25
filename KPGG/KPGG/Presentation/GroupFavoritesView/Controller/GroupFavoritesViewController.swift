//
//  GroupFavoritesViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit
import Kingfisher

class GroupFavoritesViewController: UIViewController {
    
    @IBOutlet weak var groupFavoritesView: UITableView!
    
    private var groupFavoritesViewModel: GroupFavoritesViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showGroupFavoritesViewController(with: GroupFavoritesViewModel())
        groupFavoritesView.reloadData()
        fetchGroupFavorites()
        groupFavoritesView.dataSource = self
        groupFavoritesView.delegate = self
    }
    
    private func fetchGroupFavorites() {
        guard let groupFavoritesViewModel = groupFavoritesViewModel else { return }
        groupFavoritesViewModel.fetch()
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
        cell.groupName.text = groupFavoritesViewModel.favorites()?[indexPath.row].groupname
        guard let imageUrl = URL(string: groupFavoritesViewModel.favorites()?[indexPath.row].groupimage ?? "") else { return UITableViewCell() }
        cell.groupImage.kf.setImage(with: imageUrl)
        return cell
    }
    
}

extension GroupFavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
