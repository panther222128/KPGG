//
//  MemberDetailViewController.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
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
    
    private var memberDetailViewModel: MemberDetailViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureElementTitle()
        configureElement()
        configureImage()
        viewConfiguration()
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
        self.activityName.text = memberDetailViewModel?.activityName()
        self.name.text = memberDetailViewModel?.name()
        self.birth.text = memberDetailViewModel?.birth()
        self.mbti.text = memberDetailViewModel?.mbti()
        self.bloodType.text = memberDetailViewModel?.bloodType()
        self.isPreviousMember.text = memberDetailViewModel?.isPreviousMember()
        self.activityName.textColor = .white
        self.name.textColor = .white
        self.birth.textColor = .white
        self.mbti.textColor = .white
        self.bloodType.textColor = .white
        self.isPreviousMember.textColor = .white
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
    
    func showMemberDetailViewController(with viewModel: MemberDetailViewModelType) {
        self.memberDetailViewModel = viewModel
    }
    
}
