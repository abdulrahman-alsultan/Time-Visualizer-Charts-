//
//  ChartViewController.swift
//  Time Visualizer (Charts)
//
//  Created by admin on 26/12/2021.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {
    
    var list: [[[String]]] = []
    var words: [String] = []
    var repeating: [Int] = []
    
    var count = [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
    ]
    
    var pieChart = PieChartView()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countRepeatedWord()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(navigate(gesture:)))
        swipe.direction = .right
        self.view.addGestureRecognizer(swipe)
        
        pieChart.delegate = self
        tableView.dataSource = self
        
    }
    @objc func navigate(gesture: UISwipeGestureRecognizer){
        performSegue(withIdentifier: "ToMain", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        destination.tasks = list
        destination.words = words
    }
    
    func countRepeatedWord(){
        for i in list{
            for j in i{
                if j[1].contains(words[0]){
                    count[0] = count[0] + 1
                }
                if j[1].contains(words[1]){
                    count[1] = count[1] + 1
                }
                if j[1].contains(words[2]){
                    count[2] = count[2] + 1
                }
                if j[1].contains(words[3]){
                    count[3] = count[3] + 1
                }
                if j[1].contains(words[4]){
                    count[4] = count[4] + 1
                }
                if j[1].contains(words[5]){
                    count[5] = count[5] + 1
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height * 0.25)
        view.addSubview(pieChart)
        
        var entries = [ChartDataEntry]()
        
        for c in count{
            entries.append(ChartDataEntry(x: Double(c), y: Double(c)))
        }
        
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.colorful()
        let data = PieChartData(dataSet: set)
        pieChart.data = data
    }
}


extension ChartViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[0].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChartCell", for: indexPath) as! ChartTableViewCell
        
        cell.setCells(sa: list[0][indexPath.row][1], s: list[1][indexPath.row][1], m: list[2][indexPath.row][1], t: list[3][indexPath.row][1], w: list[4][indexPath.row][1], th: list[5][indexPath.row][1], f: list[6][indexPath.row][1], time: list[0][indexPath.row][0])
        
        return cell
    }
    
    
}
