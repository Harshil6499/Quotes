//
//  ViewController.swift
//  QuotsAPI
//
//  Created by Apple on 15/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    
    @IBAction func ViewCategoryAPI(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(identifier: "categoryvc") as! DisplayCategoryViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func ViewProductAPI(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(identifier: "productvc") as! DisplayProductViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func ViewRandomAPI(_ sender: Any) {
        let VC = storyboard?.instantiateViewController(identifier: "randomvc") as! DisplayRandomViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

