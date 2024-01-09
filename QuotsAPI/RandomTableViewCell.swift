//
//  RandomTableViewCell.swift
//  QuotsAPI
//
//  Created by Apple on 15/08/23.
//

import UIKit

class RandomTableViewCell: UITableViewCell {

    @IBOutlet weak var Messagelbl: UILabel!
    
    @IBOutlet weak var PRODUCTTITLElbl: UILabel!
    
    @IBOutlet weak var CATEGORYNAMElbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
