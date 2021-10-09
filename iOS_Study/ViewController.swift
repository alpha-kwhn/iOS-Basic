//
//  ViewController.swift
//  iOS_Study
//
//  Created by 김응관 on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {
    //Class 'ViewController' has no initializers --> 모든 인스턴스 변수는 초기화를 해야한다
    //1. 이니셜라이저 이용(init)
    //2. =0 사용하기
    
    //var flipCount : Int = 0 타입추론을 적용해서 간결한 코드 작성이 가능하다
    var flipCount = 0 //Swift가 Int라고 타입추론을 함
    {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
        //속성 감시자 didSet을 사용
        //flipCount가 바뀔때마다 didSet을 실행 --> 레이블과 소통해서 Update
    }
    
    //Swift에서 UI 타입추론은 불가능하다
    //!의 의미 :
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if(button.currentTitle == emoji) {
            button.setTitle("", for : UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for : UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
    
}

