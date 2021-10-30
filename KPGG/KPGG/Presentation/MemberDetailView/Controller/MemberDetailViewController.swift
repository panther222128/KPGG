//
//  MemberDetailViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit

final class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var memberMainImage: UIImageView!
    
    @IBOutlet weak var activityNameTitle: UILabel!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var birthTitle: UILabel!
    @IBOutlet weak var mbtiTitle: UILabel!
    @IBOutlet weak var bloodTypeTitle: UILabel!
    @IBOutlet weak var isPreviousMemberTitle: UILabel!
    
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var mbti: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var isPreviousMember: UILabel!

    @IBOutlet weak var favoritesButton: UIButton!
    private var memberDetailViewModel: MemberDetailViewModelType?
    private var buttonHidden: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureElementTitle()
        configureElement()
        configureImage()
        configureNavigation()
        viewConfiguration()
        buttonHide()
    }

    private func buttonHide() {
        guard let buttonHidden = buttonHidden else { return }
        if buttonHidden == true {
            favoritesButton.isHidden = true
        } else {
            favoritesButton.isHidden = false
        }
    }
    
    private func configureElementTitle() {
        self.activityNameTitle.text = "활동명"
        self.nameTitle.text = "본명"
        self.birthTitle.text = "생년월일"
        self.mbtiTitle.text = "MBTI"
        self.bloodTypeTitle.text = "혈액형"
        self.isPreviousMemberTitle.text = "탈퇴여부"
        self.activityNameTitle.textColor = .white
        self.nameTitle.textColor = .white
        self.birthTitle.textColor = .white
        self.mbtiTitle.textColor = .white
        self.bloodTypeTitle.textColor = .white
        self.isPreviousMemberTitle.textColor = .white
    }
    
    private func configureElement() {
        guard let memberDetailViewModel = memberDetailViewModel else { return }
        self.activityName.text = "\t\(memberDetailViewModel.activityName())"
        self.name.text = "\t\(memberDetailViewModel.name())"
        self.birth.text = "\t\(memberDetailViewModel.birth())"
        self.mbti.text = "\t\(memberDetailViewModel.mbti())"
        self.bloodType.text = "\t\(memberDetailViewModel.bloodType())"
        self.isPreviousMember.text = "\t\(memberDetailViewModel.isPreviousMember())"
        self.activityName.textColor = .systemGray
        self.name.textColor = .systemGray
        self.birth.textColor = .systemGray
        self.mbti.textColor = .systemGray
        self.bloodType.textColor = .systemGray
        self.isPreviousMember.textColor = .systemGray
    }
    
    private func configureNavigation() {
        guard let memberDetailViewModel = memberDetailViewModel else { return }
        self.navigationItem.title = memberDetailViewModel.activityName()
        self.navigationItem.backButtonTitle = "   "
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    private func configureImage() {
        guard let memberDetailViewModel = memberDetailViewModel else { return }
        guard let imageUrl = URL(string: memberDetailViewModel.mainImage()) else { return }
        do {
            let data = try Data(contentsOf: imageUrl)
            self.memberMainImage.image = UIImage(data: data)
        } catch {
            
        }
    }
    
    private func viewConfiguration() {
        self.view.backgroundColor = .black
    }
    
    @IBAction func insertAtFavoritesMember(_ sender: Any) {
        guard let memberDetailViewModel = memberDetailViewModel else { return }
        memberDetailViewModel.insertAtFavoritesMember(member: memberDetailViewModel.selectedMember())
    }
    
    func showMemberDetailViewController(with viewModel: MemberDetailViewModelType, buttonHidden: Bool) {
        self.memberDetailViewModel = viewModel
        self.buttonHidden = buttonHidden
    }
    
}
