//
//  DisplayProductViewController.swift
//  QuotsAPI
//
//  Created by Apple on 15/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class DisplayProductViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var ProductTableView: UITableView!
    @IBOutlet weak var MyDatalbl: UILabel!
    
    var arr_product_id = [String]()
    var arr_product_title = [String]()
    var arr_product_image = [String]()
    var arr_categoty_ID = [String]()
    var arr_category_NAME = [String]()
    
    var category_id = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Product_API ()
        MyDatalbl.text = category_id
        self.ProductTableView.dataSource = self
        self.ProductTableView.delegate = self
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_product_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "productcell") as! ProductTableViewCell
        mycell.ProductIdlbl.text! = arr_product_id[indexPath.row]
        mycell.ProductTitlelbl.text! = arr_product_title[indexPath.row]
        
        let url = URL(string:arr_product_image[indexPath.row])
        mycell.MyProductimg.af.setImage(withURL: url!)
        
        mycell.CategoryIDlbl.text! = arr_categoty_ID[indexPath.row]
        mycell.CategoryNAMElbl.text! = arr_category_NAME[indexPath.row]
        
        return mycell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let VC = storyboard?.instantiateViewController(withIdentifier: "DetailsCategoryViewController") as! DetailsCategoryViewController
            VC.PID = self.arr_product_id[indexPath.row]
            VC.PDETAIL = self.arr_product_title[indexPath.row]
            VC.image = self.arr_product_image[indexPath.row]
            VC.CID = self.arr_categoty_ID[indexPath.row]
            VC.CDETAIL = self.arr_category_NAME[indexPath.row]
        self.navigationController?.pushViewController(VC, animated: true)
    }
        //API CALLING___________________
        
        func Product_API (){
            
            let Product_API_URL = "https://harshil.in/myapi/at-quotes/api/api-list-product.php?category_id=\(category_id)"
            
            AF.request(Product_API_URL,method: .get).responseJSON{(response) in
                switch response.result{
                case .success:
                    
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    let resultArray = myresult!["product_list"]
                    print(resultArray["product_list"])
                    self.arr_product_id.removeAll()
                    self.arr_product_title.removeAll()
                    self.arr_product_image.removeAll()
                    self.arr_categoty_ID.removeAll()
                    self.arr_category_NAME.removeAll()
                    
                    for i in resultArray.arrayValue{
                        
                        let product_id = i["product_id"].stringValue
                        self.arr_product_id.append(product_id)
                        
                        let product_title = i["product_title"].stringValue
                        self.arr_product_title.append(product_title)
                        
                        let product_image = i["product_image"].stringValue
                        self.arr_product_image.append(product_image)
                        
                        let category_id = i["category_id"].stringValue
                        self.arr_categoty_ID.append(category_id)
                        
                        let category_name = i["category_name"].stringValue
                        self.arr_category_NAME.append(category_name)
                        
                        print(product_id)
                        print(product_title)
                        print(product_image)
                        print(category_id)
                        print(category_name)
                    }
                    self.ProductTableView.reloadData()
                    break
                case .failure:
                    break
                }
            }
        }
        
    }

