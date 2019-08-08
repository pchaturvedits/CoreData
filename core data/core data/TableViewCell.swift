//
//  TableViewCell.swift
//  core data
//
//  Created by Manish Chaturvedi on 7/25/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var addlbl: UILabel!
    @IBOutlet weak var mobilelbl: UILabel!
    @IBOutlet weak var citylbl: UILabel!
    
    var student:Student!{
    didSet{
        namelbl.text = student.name
        addlbl.text = student.address
        citylbl.text = student.city
        mobilelbl.text = student.mobile
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
