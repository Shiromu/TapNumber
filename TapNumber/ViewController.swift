//
//  ViewController.swift
//  TapNumber
//
//  Created by Shiromu on 2018/09/17.
//  Copyright © 2018年 Shiromu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //ラベル関連付け
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    //ボタン関連付け
    
    @IBOutlet var bu1: UIButton!
    @IBOutlet var bu2: UIButton!
    @IBOutlet var bu3: UIButton!
    @IBOutlet var bu4: UIButton!
    @IBOutlet var bu5: UIButton!
    @IBOutlet var bu6: UIButton!
    @IBOutlet var bu7: UIButton!
    @IBOutlet var bu8: UIButton!
    @IBOutlet var bu9: UIButton!
    

    //タイマーオブジェクト
    var timer: Timer = Timer()
    var time: Double = 15
    //押されたボタン番号
    var buttonNum: Int!
    var buttonArray: [String] = []
    var collectArray = ["1","2","3","4","5","6","7","8","9"]
    
    var collect: Bool!
    
    var score = 0
    
    var i:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "0"
        timeLabel.text = "15.00"
        
    }

    func buttonReset(){
        buttonArray = []
        collectArray = ["1","2","3","4","5","6","7","8","9"]
        var tmpArray = ["1","2","3","4","5","6","7","8","9"]
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            buttonArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        bu1.setTitle(buttonArray[0], for: .normal)
        bu2.setTitle(buttonArray[1], for: .normal)
        bu3.setTitle(buttonArray[2], for: .normal)
        bu4.setTitle(buttonArray[3], for: .normal)
        bu5.setTitle(buttonArray[4], for: .normal)
        bu6.setTitle(buttonArray[5], for: .normal)
        bu7.setTitle(buttonArray[6], for: .normal)
        bu8.setTitle(buttonArray[7], for: .normal)
        bu9.setTitle(buttonArray[8], for: .normal)
    }
    
    @objc func minusTime(){
        time -= 0.01
        timeLabel.text = String(format: "%.2f",time)
        if time <= 0{
            timer.invalidate()
            parformSegueToResult()
        }
    }
    
    @IBAction func Start() {
        if !timer.isValid{
            time = 15
            score = 0
            scoreLabel.text = "0"
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.minusTime), userInfo: nil, repeats: true)
            buttonReset()
        }
    }
    
//    @IBAction func button(sender: UIButton){
//        //let tmpArray = buttonArray
//        let arrayCount: Int = (buttonArray.count)
//        var collectNum: Int = 10 - arrayCount
//        buttonNum = sender.tag
//    }
    
    func collectCheck(){
        if collectArray[0] == buttonArray[buttonNum]{
            collect = true
            score += 10
            scoreLabel.text = String(score)
            collectArray.remove(at: 0)
            if collectArray.count == 0{
                time += 1
            }
        } else {
            collect = false
        }
    }
    
    @IBAction func button1(){
        buttonNum = 0
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu1.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
        
    }
    @IBAction func button2(){
        buttonNum = 1
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu2.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button3(){
        buttonNum = 2
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu3.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button4(){
        buttonNum = 3
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu4.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button5(){
        buttonNum = 4
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu5.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button6(){
        buttonNum = 5
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu6.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button7(){
        buttonNum = 6
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu7.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button8(){
        buttonNum = 7
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu8.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    @IBAction func button9(){
        buttonNum = 8
        if timer.isValid{
            self.collectCheck()
            if collect{
                bu9.setTitle(" ", for: .normal)
            }
            if collectArray.count == 0{
                buttonReset()
            }
        }
    }
    
    func parformSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.score = self.score
            //正解数の受け渡しをする
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

