//
//  newsTableViewCell.swift
//  spark_ver_0.0.1
//
//  Created by Howard Yong on 4/19/19.
//  Copyright © 2019 Howard Yong. All rights reserved.
//

import UIKit

class newsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsHeader: UITextView!
    @IBOutlet weak var newsCoverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
