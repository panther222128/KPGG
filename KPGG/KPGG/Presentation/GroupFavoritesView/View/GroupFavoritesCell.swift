//
//  GroupFavoritesCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit

class GroupFavoritesCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
