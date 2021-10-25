//
//  GroupMemberViewCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit
import Kingfisher

class GroupMemberViewCell: UITableViewCell {
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(memberActivityName: String, imageUrl: URL) {
        self.backgroundColor = .clear
        self.memberImage.kf.setImage(with: imageUrl)
        self.memberImage.contentMode = .scaleAspectFit
        self.memberName.text = memberActivityName
        self.memberName.textAlignment = .center
        self.memberName.textColor = .white
    }
    
}
