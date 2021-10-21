//
//  GroupMemberViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit
import RxSwift

class GroupMemberViewController: UIViewController {
    
    @IBOutlet weak var groupMember: UITableView!
    @IBOutlet weak var representativeSongButton: UIButton!
    
    private var groupMemberViewModel: GroupMemberViewModelType?
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        configureNavigation()
        configureGroupMember()
        configureRepresentativeSongButton()
        subscribe()
        fetchMembers()
        groupMember.dataSource = self
        groupMember.delegate = self
    }
    
    private func subscribe()  {
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
    
    private func configureRepresentativeSongButton() {
        representativeSongButton.titleLabel?.text = "대표곡 듣기"
    }
    
    private func configureNavigation() {
        guard let groupMemberViewModel = groupMemberViewModel else { return }
        self.navigationItem.title = groupMemberViewModel.groupNameReturn()
        self.navigationItem.backButtonTitle = " "
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func showGroupMemberViewController(with viewModel: GroupMemberViewModelType) {
        self.groupMemberViewModel = viewModel
    }
    
}

extension GroupMemberViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.groupMemberViewModel?.membersCount() else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? GroupMemberViewCell else { return UITableViewCell() }
        let imageUrl = URL(string: groupMemberViewModel?.member()?[indexPath.row].mainimage ?? "")
        var data = Data()
        do {
            data = try Data(contentsOf: imageUrl!)
        } catch {
            
        }
        let memberActivityName = groupMemberViewModel?.member()?[indexPath.row].activityname ?? ""
        cell.configureCell(memberActivityName: memberActivityName, imageData: data)
        return cell
    }
    
}

extension GroupMemberViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let memberDetailViewContrller = self.storyboard?.instantiateViewController(withIdentifier: "MemberDetail") as? MemberDetailViewController else { return }
        guard let member = self.groupMemberViewModel?.member()?[indexPath.row] else { return }
        memberDetailViewContrller.showMemberDetailViewController(with: MemberDetailViewModel(member: member))
        self.navigationController?.pushViewController(memberDetailViewContrller, animated: true)
    }
    
}
