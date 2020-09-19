//
//  ViewController.swift
//  QuestionApp1
//
//  Created by 山岡巧 on 2020/09/05.
//  Copyright © 2020 takumi.yamaoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    let imagesList = ImagesList()
    // IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
    }
        
    @IBAction func answer(_ sender: Any) {
        // まるボタンが押された時
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
                        
            // まるボタンの音声をながす
            
        // ばつボタンが押された時
        } else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
                        
            // ばつボタンの音声をながす
            
        }
        // チェック　回答があっているか(pickedAnswerとImagesListのcorrectOrNotの値が一致しているかどうか)
               check()
               nextQuestions()
    }

    func check(){
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("正解")
            correctCount = correctCount + 1
        } else {
            print("間違え")
            wrongCount = wrongCount + 1
        }
    }
        
        func nextQuestions(){
            if questionNumber <= 9 {
                questionNumber = questionNumber + 1
                imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
            } else {
                print("問題終了")
                // 画面遷移
                performSegue(withIdentifier: "next", sender: nil)
            }
        }
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
            if segue.identifier == "next" {
                let nextVC = segue.destination as! NextViewController
                nextVC.correctedCount = correctCount
                nextVC.wrongCount = wrongCount
            }
        }
        }
        

