//
//  CustomDetailTableViewCell.swift
//  Tires
//
//  Created by Mikhail on 27.09.2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit

class CustomDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
