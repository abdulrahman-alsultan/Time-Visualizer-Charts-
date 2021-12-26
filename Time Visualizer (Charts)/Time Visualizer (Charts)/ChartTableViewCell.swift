//
//  ChartTableViewCell.swift
//  Time Visualizer (Charts)
//
//  Created by admin on 26/12/2021.
//

import UIKit

class ChartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var sat: UILabel!
    @IBOutlet weak var sun: UILabel!
    @IBOutlet weak var mon: UILabel!
    @IBOutlet weak var tue: UILabel!
    @IBOutlet weak var wed: UILabel!
    @IBOutlet weak var thu: UILabel!
    @IBOutlet weak var fri: UILabel!
    @IBOutlet weak var hour: UILabel!
    
    func setCells(sa: String,s: String, m: String, t: String, w: String, th: String, f: String, time: String){
        sat.text = sa
        sun.text = s
        mon.text = m
        tue.text = t
        wed.text = w
        thu.text = th
        fri.text = f
        hour.text = time
        
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
