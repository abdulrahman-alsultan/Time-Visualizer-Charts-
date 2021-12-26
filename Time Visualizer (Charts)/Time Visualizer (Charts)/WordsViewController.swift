//
//  WordsViewController.swift
//  Time Visualizer (Charts)
//
//  Created by admin on 26/12/2021.
//

import UIKit

class WordsViewController: UIViewController {

    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var third: UITextField!
    @IBOutlet weak var fourth: UITextField!
    @IBOutlet weak var fifth: UITextField!
    @IBOutlet weak var sixth: UITextField!
    
    var word1 = ""
    var word2 = ""
    var word3 = ""
    var word4 = ""
    var word5 = ""
    var word6 = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        first.text = word1
        second.text = word2
        third.text = word3
        fourth.text = word4
        fifth.text = word5
        sixth.text = word6
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(navigate(gesture:)))
        swipe.direction = .left
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc func navigate(gesture: UISwipeGestureRecognizer){
        performSegue(withIdentifier: "ToMainScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        
        destination.words[0] = first.text ?? ""
        destination.words[1] = second.text ?? ""
        destination.words[2] = third.text ?? ""
        destination.words[3] = fourth.text ?? ""
        destination.words[4] = fifth.text ?? ""
        destination.words[5] = sixth.text ?? ""
    }
    
}
