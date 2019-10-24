//
//  MenuCell.swift
//  MahendraTest
//
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subCategory: UILabel!
    @IBOutlet weak var proName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setInfo(info:Sale) {
        nameLabel.text = info.country
        subCategory.text = "sales: ₹\(info.price)"
        proName.text = info.prod
    }
    
}
