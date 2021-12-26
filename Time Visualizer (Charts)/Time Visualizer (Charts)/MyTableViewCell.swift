//
//  MyTableViewCell.swift
//  Time Visualizer (Charts)
//
//  Created by admin on 25/12/2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var task: UITextField!
    
    func setCell(t: String, ts: String){
        time.text = t
        task.text = ts
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
