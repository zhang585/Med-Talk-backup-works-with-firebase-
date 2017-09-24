//
//  drugCell.swift
//  Med Talk
//
//  Created by Sandy Zhang on 6/20/17.
//  Copyright © 2017 Sandy Zhang. All rights reserved.
//

import UIKit

class drugCell: UITableViewCell {
    @IBOutlet var genericLabel: UILabel!
    @IBOutlet var brandLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        genericLabel.adjustsFontForContentSizeCategory = true
        brandLabel.adjustsFontForContentSizeCategory = true
        
    }
}
