//
//  GroupMemberViewCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit
import Kingfisher

final class GroupMemberViewCell: UITableViewCell {
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ member: Member) {
        self.backgroundColor = .clear
        guard let url = URL(string: member.mainimage) else { return }
        self.memberImage.kf.setImage(with: url)
        self.memberImage.contentMode = .scaleAspectFit
        self.memberName.text = member.activityname
        self.memberName.textAlignment = .center
        self.memberName.textColor = .white
    }
    
}
