//
//  recTableViewCell.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/17/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit

class recTableViewCell: UITableViewCell {

    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var recTypeImage: UIImageView!
    @IBOutlet weak var recPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
