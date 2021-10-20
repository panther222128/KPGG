//
//  GroupMemberViewCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/20.
//

import UIKit

class GroupMemberViewCell: UITableViewCell {
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(memberActivityName: String, imageData: Data) {
        self.backgroundColor = .clear
        self.memberImage.image = UIImage(data: imageData)
        self.memberName.text = memberActivityName
        self.memberName.textAlignment = .center
        self.memberName.textColor = .white
    }

}
