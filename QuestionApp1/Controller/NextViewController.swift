//
//  NextViewController.swift
//  QuestionApp1
//
//  Created by 山岡巧 on 2020/09/05.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import UIKit

protocol NowScoreDelegate {
    func nowScore(score:Int)
}

class NextViewController: UIViewController {
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var correctedCount = Int()
    var wrongCount = Int()
    var beforeCount = Int()
    var delegate:NowScoreDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        // もし最高得点であれば、入れ替え
        if beforeCount < correctedCount {
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            delegate?.nowScore(score: correctedCount)
            
        // そうでない場合は、入れ換えない
        } else if beforeCount > correctedCount {
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
