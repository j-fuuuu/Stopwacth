//
//  ViewController.swift
//  Stopwacth
//
//  Created by 藤井玖光 on 2022/08/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count:Float = 0.0
    
    var timer: Timer = Timer()
    
    //判定ラベル
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        //countを0.01足す
        count = count + 0.01
        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    @IBAction func start(){
        
        if !timer.isValid{
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        resultLabel.text = ""
    }
    
    @IBAction func stop(){
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
            
        }
        //判定のメソッドを呼び出し結果を表示
        self.hantei()
    }
    
    func hantei(){
        //もし、経過時間が9.8~10.2秒の間だった場合Perfectと表示
        if count > 9.8 && count < 10.20{
            resultLabel.text = "Perfect!"
        }else if count > 9.70 && count < 10.3{
            resultLabel.text = "Great!" //経過時間が9.7から10.3秒だった場合GREATと表示
        }else if count > 9.50 && count < 10.5{
            resultLabel.text = "Good!"
        }else{
            resultLabel.text = "bad!"
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            //タイマーが動いていたら止める
            timer.invalidate()
        }
        //カウントを0にする
        count = 0.0
        //初期化したcountをLabelに表示
        label.text = String(format: "%.2f", count)
    }
   
}

