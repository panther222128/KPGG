//
//  MemberFavoritesCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit
import Kingfisher

class MemberFavoritesCell: UITableViewCell {
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(imageUrl: URL, memberName: String) {
        self.backgroundColor = .clear
        self.memberName.textColor = .white
        self.memberImage.kf.setImage(with: imageUrl)
        self.memberName.text = memberName
    }
    
}
