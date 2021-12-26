//
//  ViewController.swift
//  Time Visualizer (Charts)
//
//  Created by admin on 25/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayPicker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    var words: [String] = [
        "",
        "",
        "",
        "",
        "",
        "",
    ]
    
    let days = [
        "Sat",
        "Sun",
        "Mon",
        "Tue",
        "Wed",
        "Thu",
        "Fri",
    ]
    
    var tasks: [[[String]]] = []
    
    var currentDay = 0
    
    var currentDayList: [[String]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareLists()
        currentDayList = tasks[currentDay]
        
        dayPicker.dataSource = self
        dayPicker.delegate = self
        dayPicker.setValue(UIColor.white, forKey: "textColor")
        tableView.delegate = self
        tableView.dataSource = self
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToWordsScreen(gesture: )))
        rightSwipe.direction = .right
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToChart(gesture: )))
        leftSwipe.direction = .left
        
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func moveToWordsScreen(gesture: UISwipeGestureRecognizer){
        performSegue(withIdentifier: "ToWordsScreen", sender: WordsViewController())
    }
    
    @objc func moveToChart(gesture: UISwipeGestureRecognizer){
        performSegue(withIdentifier: "ToChart", sender: ChartViewController())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is ChartViewController{
            let destination = segue.destination as! ChartViewController
            destination.list = tasks
            destination.words = words
        }
        else{
            let destination = segue.destination as! WordsViewController
            destination.word1 = words[0]
            destination.word2 = words[1]
            destination.word3 = words[2]
            destination.word4 = words[3]
            destination.word5 = words[4]
            destination.word6 = words[5]
        }
    }
    
    func prepareLists(){
        var ampm = "am"
        var min = ""
        for i in 0...6{
            tasks.append([])
            var idx = 0
            ampm = "am"
            for j in 0...23{
                if j >= 12{
                    ampm = "pm"
                }
                for k in 0...1{
                    tasks[i].append([])
                    if k == 0{
                        min = "00"
                    }
                    else{
                        min = "30"
                    }
                    
                    if j < 10{
                        tasks[i][idx].append("0\(j):\(min) \(ampm)")
                        tasks[i][idx].append("")
                    }
                    else{
                        tasks[i][idx].append("\(j):\(min) \(ampm)")
                        tasks[i][idx].append("")
                    }
                    idx += 1
                }
            }
        }
    }
}


extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        days.count
    }
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return days[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentDay = row
        currentDayList = tasks[currentDay]
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate{
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyTask", for: indexPath) as! MyTableViewCell

        cell.setCell(t: currentDayList[indexPath.row][0], ts: currentDayList[indexPath.row][1])
        cell.task.tag = currentDay * 100 + indexPath.row
        cell.task.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
        
        
        return cell
    }
    
    @objc func textFieldChanged(_ textField: UITextField){
        let i: Int = textField.tag / 100
        let i2 = textField.tag - i * 100
        tasks[i][i2][1] = textField.text ?? ""
    }
}
