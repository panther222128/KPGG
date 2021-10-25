//
//  MemberFavoritesCell.swift
//  KPGG
//
//  Created by Jun Ho JANG on 2021/10/25.
//

import UIKit

class MemberFavoritesCell: UITableViewCell {
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
