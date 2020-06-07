//
//  AdTableViewCell.swift
//  CollectionViewDemo
//
//  Created by Pradeep on 07/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
