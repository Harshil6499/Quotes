//
//  DisplayRandomViewController.swift
//  QuotsAPI
//
//  Created by Apple on 15/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class DisplayRandomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var RandomTableView: UITableView!
    
    var arr_message = [String]()
    var PRODUCT_TITLE = [String]()
    var CATEGOY_NAME = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.RandomTableView.delegate = self
        self.RandomTableView.dataSource = self
        
        RANDOM_API()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomcell") as! RandomTableViewCell
        cell.Messagelbl.text = arr_message[indexPath.row]
        cell.PRODUCTTITLElbl.text = PRODUCT_TITLE[indexPath.row]
        cell.CATEGORYNAMElbl.text = CATEGOY_NAME[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //API_CALLING________________
    
    func RANDOM_API (){
        
        let RANDOM_API_URL = "https://harshil.in/myapi/at-quotes/api/api-random-detail.php"
        
        AF.request(RANDOM_API_URL).responseJSON{(response) in
            switch response.result{
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["product_list"])
                
                let resultArray = myresult!["product_list"]
                print(resultArray["product_list"])
                
                self.arr_message.removeAll()
                self.PRODUCT_TITLE.removeAll()
                self.CATEGOY_NAME.removeAll()
                
                for i in resultArray.arrayValue{
                    let message = i["message"].stringValue
                    self.arr_message.append(message)
                    
                    let product_title = i["product_title"].stringValue
                    self.PRODUCT_TITLE.append(product_title)
                    
                    let category_name = i["category_name"].stringValue
                    self.CATEGOY_NAME.append(category_name)
                    
                    print(message)
                    print(product_title)
                    print(category_name)
                }
                self.RandomTableView.reloadData()
                break
            case .failure:
                break
            }
        }
        
    }
}
