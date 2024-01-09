//
//  DisplayCategoryViewController.swift
//  QuotsAPI
//
//  Created by Apple on 15/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class DisplayCategoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arr_category_id = [String]()
    var arr_categoty_name = [String]()
    var arr_category_image = [String]()
    
    @IBOutlet weak var MyCategoryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MyCategoryTableView.delegate = self
        self.MyCategoryTableView.dataSource = self
        
        Category_API()
        self.MyCategoryTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_category_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categorycell") as! CategoryTableViewCell
        cell.CategoryIDlbl.text! = arr_category_id[indexPath.row]
        cell.CategoryNamelbl.text! = arr_categoty_name[indexPath.row]
        
        let url = URL(string: arr_category_image[indexPath.row])
        cell.MyCategoryimg.af.setImage(withURL: url!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let main = storyboard?.instantiateViewController(withIdentifier: "productvc") as! DisplayProductViewController
        main.category_id = arr_category_id[indexPath.row]
        self.navigationController?.pushViewController(main, animated: true)
    }
    
    //API CALLING_____________________
    
    func Category_API () {
        
        let Category_API_URL = "https://harshil.in/myapi/at-quotes/api/api-list-category.php"
    
        AF.request(Category_API_URL).responseJSON{(response) in
            switch response.result{
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                //print(myresult!["category_list"])
                
                let resultArray = myresult!["category_list"]
                //print(resultArray["category_list"])
            
                self.arr_categoty_name.removeAll()
                self.arr_category_id.removeAll()
                self.arr_category_image.removeAll()
                
                for i in resultArray.arrayValue{
                    let category_id = i["category_id"].stringValue
                    self.arr_category_id.append(category_id)

                    let category_name = i["category_name"].stringValue
                    self.arr_categoty_name.append(category_name)
                                        
                    let category_image = i["category_image"].stringValue
                    self.arr_category_image.append(category_image)
                    
                    print(category_name)
                }
            self.MyCategoryTableView.reloadData()
            break
        case .failure:
            break
        }
            
        }
        self.MyCategoryTableView.reloadData()
    }


}
