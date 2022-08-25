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
    }
    
    @IBAction func stop(){
        if timer.isValid{
            //タイマーが動作していたら停止する
            timer.invalidate()
        }
    }


}

