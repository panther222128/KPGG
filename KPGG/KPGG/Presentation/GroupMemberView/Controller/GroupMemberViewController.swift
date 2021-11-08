//
//  GroupMemberViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit
import RxSwift

final class GroupMemberViewController: UIViewController {
    
    @IBOutlet weak var groupMember: UITableView!
    @IBOutlet weak var playSong: UIButton!
    @IBOutlet weak var insertAtFavorites: UIButton!
    
    private var groupMemberViewModel: GroupMemberViewModelType?
    private var disposeBag = DisposeBag()
    private var isInsertAtFavoritesHidden: Bool?
    private var groupFavoritesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        configureNavigation()
        configureGroupMember()
        subscribeFromGroupMemberViewModel()
        fetchMembers()
        groupMember.dataSource = self
        groupMember.delegate = self
        groupMember.prefetchDataSource = self
        groupFavoritesButtonHide()
        setGroupFavoritesCount()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGroupFavoritesCount()
    }
    
    private func setGroupFavoritesCount() {
        guard let groupMemberViewModel = groupMemberViewModel else { return }
        groupFavoritesCount = groupMemberViewModel.groupFavoritesCount()
    }
    
    private func groupFavoritesButtonHide() {
        if self.groupMemberViewModel?.isGroupFavoritesContains() == true {
            insertAtFavorites.isHidden = true
            playSong.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            playSong.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        } else {
            insertAtFavorites.isHidden = false
        }
    }
    
    private func subscribeFromGroupMemberViewModel()  {
        self.groupMemberViewModel?.membersSubject().subscribe(onNext:{ [weak self] _ in
            self?.groupMember.reloadData()
        }).disposed(by: disposeBag)
    }
    
    private func fetchMembers() {
        self.groupMemberViewModel?.fetch().subscribe { [weak self] members in
            self?.groupMemberViewModel?.configureMembers(members)
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
    
    private func viewConfiguration() {
        self.view.backgroundColor = .black
    }
    
    private func configureGroupMember() {
        groupMember.backgroundColor = .black
    }
    
    private func configureNavigation() {
        guard let groupMemberViewModel = groupMemberViewModel else { return }
        self.navigationItem.title = groupMemberViewModel.groupNameReturn()
        self.navigationItem.backButtonTitle = "   "
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }

    func showGroupMemberViewController(with viewModel: GroupMemberViewModelType) {
        self.groupMemberViewModel = viewModel
    }
    
    @IBAction func playHitSongAction(_ sender: Any) {
        guard let groupHitSong = groupMemberViewModel?.groupHitSongReturn() else { return }
        guard let videoPlayerViewController = UIStoryboard(name: "VideoView", bundle: nil).instantiateViewController(withIdentifier: "Video") as? VideoViewController else { return }
        videoPlayerViewController.showMusicVideoViewController(with: MusicVideoViewModel(youtubeId: groupHitSong))
        videoPlayerViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(videoPlayerViewController, animated: true)
    }
    
    @IBAction func insertAtFavoritesGroupAction(_ sender: Any) {
        guard let groupMemberViewModel = groupMemberViewModel else { return }
        groupMemberViewModel.insertAtFavoritesGroup(groupMemberViewModel.selectedGroup())
        insertAtFavorites.isHidden = true
        playSong.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playSong.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        if self.groupFavoritesCount + 1 == groupMemberViewModel.groupFavoritesCount() {
            let addSuccessAlert = UIAlertController(title: "추가하기", message: "정상적으로 추가되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let addSuccessAlertAction = UIAlertAction(title: "OK", style: .default) { action in
                self.navigationController?.popViewController(animated: true)
            }
            addSuccessAlert.addAction(addSuccessAlertAction)
            present(addSuccessAlert, animated: true, completion: nil)
        } else {
            let addSuccessAlert = UIAlertController(title: "추가하기", message: "그룹이 추가되지 않았습니다.", preferredStyle: UIAlertController.Style.alert)
            let addSuccessAlertAction = UIAlertAction(title: "뒤로가기", style: .destructive) { action in
                self.navigationController?.popViewController(animated: true)
            }
            addSuccessAlert.addAction(addSuccessAlertAction)
            present(addSuccessAlert, animated: true, completion: nil)
        }
    }
    
}

extension GroupMemberViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.groupMemberViewModel?.membersCount() else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? GroupMemberViewCell else { return UITableViewCell() }
        guard let member = groupMemberViewModel?.member()?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(member)
        return cell
    }
    
}

extension GroupMemberViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let memberDetailViewContrller = self.storyboard?.instantiateViewController(withIdentifier: "MemberDetail") as? MemberDetailViewController else { return }
        guard let member = self.groupMemberViewModel?.member()?[indexPath.row] else { return }
        memberDetailViewContrller.showMemberDetailViewController(with: MemberDetailViewModel(with: member))
        self.navigationController?.pushViewController(memberDetailViewContrller, animated: true)
    }
    
}

extension GroupMemberViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? GroupMemberViewCell else { return  }
            guard let member = groupMemberViewModel?.member()?[indexPath.row] else { return }
            cell.configureCell(member)
        }
    }

}
