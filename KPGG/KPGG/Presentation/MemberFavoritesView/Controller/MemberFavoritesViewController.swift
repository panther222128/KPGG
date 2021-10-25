//
//  MemberFavoritesViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit
import Kingfisher

class MemberFavoritesViewController: UIViewController {
    
    @IBOutlet weak var memberFavoritesView: UITableView!
    
    private var memberFavoritesViewModel: MemberFavoritesViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMemberFavoritesViewController(with: MemberFavoritesViewModel())
    }
    
    func showMemberFavoritesViewController(with viewModel: MemberFavoritesViewModelType) {
        self.memberFavoritesViewModel = viewModel
    }
    
}

extension MemberFavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let memberFavoritesViewModel = memberFavoritesViewModel else { return 0 }
        return memberFavoritesViewModel.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let memberFavoritesViewModel = memberFavoritesViewModel else { return UITableViewCell() }
        guard let cell = memberFavoritesView.dequeueReusableCell(withIdentifier: "MemberFavoritesCell", for: indexPath) as? MemberFavoritesCell else { return UITableViewCell() }
        cell.memberName.text = memberFavoritesViewModel.favorites()?[indexPath.row].activityname
        guard let imageUrl = URL(string: memberFavoritesViewModel.favorites()?[indexPath.row].mainimage ?? "") else { return UITableViewCell() }
        cell.memberImage.kf.setImage(with: imageUrl)
        return cell
    }
    
    
}

extension MemberFavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
