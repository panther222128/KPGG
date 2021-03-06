//
//  MemberFavoritesViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit
import Kingfisher

final class MemberFavoritesViewController: UIViewController {
    
    @IBOutlet weak var memberFavoritesView: UITableView!
    
    private var memberFavoritesViewModel: MemberFavoritesViewModelType?
    private var memberFavoritesCount = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMemberFavoritesViewController(with: MemberFavoritesViewModel())
        memberFavoritesView.reloadData()
        fetchMemberFavorites()
        memberFavoritesView.dataSource = self
        memberFavoritesView.prefetchDataSource = self
        memberFavoritesView.delegate = self
        configureMemberFavoritesView()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchMemberFavorites()
        setGroupFavoritesCount()
        memberFavoritesView.reloadData()
    }
    
    private func setGroupFavoritesCount() {
        guard let memberFavoritesViewModel = memberFavoritesViewModel else { return }
        self.memberFavoritesCount = memberFavoritesViewModel.count()
    }
    
    private func fetchMemberFavorites() {
        guard let memberFavoritesViewModel = memberFavoritesViewModel else { return }
        memberFavoritesViewModel.fetch()
    }
    
    private func configureMemberFavoritesView() {
        self.memberFavoritesView.backgroundColor = .black
    }
    
    private func configureNavigation() {
        self.navigationItem.backButtonTitle = "   "
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.setStatusBar(backgroundColor: .black)
        if #available(iOS 11.0, *) {
            self.memberFavoritesView.contentInsetAdjustmentBehavior = .never
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
        guard let memberName = memberFavoritesViewModel.favorites()?[indexPath.row].activityname else { return UITableViewCell() }
        guard let imageUrl = URL(string: memberFavoritesViewModel.favorites()?[indexPath.row].mainimage ?? "") else { return UITableViewCell() }
        cell.configureCell(imageUrl: imageUrl, memberName: memberName)
        return cell
    }
    
}

extension MemberFavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let memberDetailViewContrller = self.storyboard?.instantiateViewController(withIdentifier: "MemberDetail") as? MemberDetailViewController else { return }
        guard let member = self.memberFavoritesViewModel?.selectedFavoriteMember(at: indexPath.row) else { return }
        memberDetailViewContrller.showMemberDetailViewController(with: MemberDetailViewModel(with: member))
        self.navigationController?.pushViewController(memberDetailViewContrller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let memberFavoritesViewModel = memberFavoritesViewModel else { return UISwipeActionsConfiguration() }
        let delete = UIContextualAction(style: .normal, title: "??????") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            memberFavoritesViewModel.deleteFavoriteMember(at: indexPath.row)
            self.fetchMemberFavorites()
            self.memberFavoritesView.reloadData()
            if self.memberFavoritesCount - 1 == memberFavoritesViewModel.count() {
                let addSuccessAlert = UIAlertController(title: "????????????", message: "??????????????? ?????????????????????.", preferredStyle: UIAlertController.Style.alert)
                let addSuccessAlertAction = UIAlertAction(title: "OK", style: .default) { action in
                    self.navigationController?.popViewController(animated: true)
                }
                addSuccessAlert.addAction(addSuccessAlertAction)
                self.memberFavoritesCount -= 1
                self.present(addSuccessAlert, animated: true, completion: nil)
            } else {
                let addSuccessAlert = UIAlertController(title: "????????????", message: "????????? ???????????? ???????????????.", preferredStyle: UIAlertController.Style.alert)
                let addSuccessAlertAction = UIAlertAction(title: "????????????", style: .destructive)
                addSuccessAlert.addAction(addSuccessAlertAction)
                self.present(addSuccessAlert, animated: true, completion: nil)
            }
            success(true)
        }
        delete.backgroundColor = .systemPink
        return UISwipeActionsConfiguration(actions:[delete])
    }
    
}

extension MemberFavoritesViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard let memberFavoritesViewModel = memberFavoritesViewModel else { return }
            guard let cell = memberFavoritesView.dequeueReusableCell(withIdentifier: "MemberFavoritesCell", for: indexPath) as? MemberFavoritesCell else { return }
            guard let memberName = memberFavoritesViewModel.favorites()?[indexPath.row].activityname else { return }
            guard let imageUrl = URL(string: memberFavoritesViewModel.favorites()?[indexPath.row].mainimage ?? "") else { return }
            cell.configureCell(imageUrl: imageUrl, memberName: memberName)
        }
    }
    
}
