//
//  DetailsCategoryViewController.swift
//  QuotsAPI
//
//  Created by Apple on 17/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class DetailsCategoryViewController: UIViewController {
    
    var PID = " "
    var PDETAIL = " "
    var image = " "
    var CID = " "
    var CDETAIL = " "
    
    @IBOutlet weak var MyDetailsImageView: UIImageView!
    @IBOutlet weak var MyProductIDlbl: UILabel!
    @IBOutlet weak var MyProductTitlelbl: UILabel!
    @IBOutlet weak var MyCategoryIDlbl: UILabel!
    @IBOutlet weak var MyCategoryNamelbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyProductIDlbl.text = PID
        MyProductTitlelbl.text = PDETAIL
        MyCategoryIDlbl.text = CID
        MyCategoryNamelbl.text = CDETAIL
        
        let url = URL(string: image)
        self.MyDetailsImageView.af.setImage(withURL: url!)
    }
}
