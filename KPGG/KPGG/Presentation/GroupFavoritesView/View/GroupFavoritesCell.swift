//
//  GroupFavoritesCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit
import Kingfisher

final class GroupFavoritesCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(imageUrl: URL, groupName: String) {
        self.backgroundColor = .clear
        self.groupImage.contentMode = .scaleAspectFit
        self.groupName.textColor = .white
        self.groupImage.kf.setImage(with: imageUrl)
        self.groupName.text = groupName
    }

}
