//
//  ListViewController.swift
//  core data
//
//  Created by Manish Chaturvedi on 7/25/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var student = [Student]()
  
    var delegate: DataPass!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        student = DatabaseHelper.shareInstacnce.getStudentData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.student = student[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            student = DatabaseHelper.shareInstacnce.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        delegate.data(object:dict as![String:String], index:indexPath.row, isEdit:true )
        self.navigationController?.popViewController(animated:true)
    }
    }


