//
//  QiitaTableViewCell.swift
//  Qiita
//
//  Created by 新妻健介 on 2017/07/11.
//  Copyright © 2017年 新妻健介. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var userName: UILabel!

    var itemURL :String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        itemImage.image = nil
    }

}
