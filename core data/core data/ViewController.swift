//
//  ViewController.swift
//  core data
//
//  Created by Manish Chaturvedi on 7/15/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit
protocol DataPass{
    func data(object: [String:String], index:Int, isEdit: Bool)
}

class ViewController: UIViewController , DataPass{
   
    
    
   
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtCity: UITextField!
    
    @IBOutlet weak var txtMobile: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func showClickBtn(_ sender: Any) {
    
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
   
    
    @IBAction func btnSaveClick(_ sender: Any) {
         let dict = ["name": txtName.text, "address": txtAddress.text, "city": txtCity.text, "mobile": txtMobile.text]
        if isUpdate {
            DatabaseHelper.shareInstacnce.editData(object:dict as! [String:String], i:i)
        }else{
        DatabaseHelper.shareInstacnce.save(object: dict as! [String: String])
    }
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        i = index
        isUpdate = isEdit
    }
   

}

