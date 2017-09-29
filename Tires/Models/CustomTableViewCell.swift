//
//  CustomTableViewCell.swift
//  Tires
//
//  Created by Mikhail on 25.09.17.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import UIKit

//Собственная реализация функционала ячейки
class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
