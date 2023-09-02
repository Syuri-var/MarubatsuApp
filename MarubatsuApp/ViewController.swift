//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by Apple on 2023/09/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNum: Int = 0
    
    // 問題
        let questions: [[String: Any]] = [
            [
                "question": "iPhoneアプリを開発する統合環境はZcodeである",
                "answer": false
            ],
            [
                "question": "Xcode画面の右側にはユーティリティーズがある",
                "answer": true
            ],
            [
                "question": "UILabelは文字列を表示する際に利用する",
                "answer": true
            ]
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    //問題を表示する関数
    func showQuestion(){
        let question = questions[currentQuestionNum]
        
        
        if let que = question["question"]as? String{
            questionLabel.text = que
            
            
        }
        /*
         
         
         */
    }
    //回答チェックの関数 正解なら次の問題を表示
    func checkAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            if yourAnswer == ans {
                
                //正解
                //currentQuestionNumを１足して次の問題に進む
                currentQuestionNum += 1
                showAlert(message: "正解!")
            }else{
                //不正解
                showAlert(message: "不正解👿")
            }
        }else{
            print("答えが入ってません")
            return
            
        }
        //currentuestionNumの値が問題数以上なら最初の問題へ
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        showQuestion() //正解→次の問題 不正解→同じ問題
        func showAlert(message: String) {
                let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                let close = UIAlertAction(title: "閉じる", style: .cancel)
                alert.addAction(close)
                present(alert, animated: true, completion: nil)
            }
        }
    
    
    @IBAction func tappedNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    

}

