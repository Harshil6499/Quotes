//
//  ProductTableViewCell.swift
//  QuotsAPI
//
//  Created by Apple on 15/08/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var ProductIdlbl: UILabel!
    @IBOutlet weak var ProductTitlelbl: UILabel!
    @IBOutlet weak var MyProductimg: UIImageView!
    @IBOutlet weak var CategoryIDlbl: UILabel!
    @IBOutlet weak var CategoryNAMElbl: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
