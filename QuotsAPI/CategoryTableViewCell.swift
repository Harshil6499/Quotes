//
//  CategoryTableViewCell.swift
//  Pods
//
//  Created by Apple on 15/08/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
  
    @IBOutlet weak var CategoryIDlbl: UILabel!
    @IBOutlet weak var CategoryNamelbl: UILabel!
    @IBOutlet weak var MyCategoryimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
