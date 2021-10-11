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
    
    lazy var game: iOS_Study = iOS_Study(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    //model과 controller의 통신 창구
    //lazy는 didSet을 가질 수 없음
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for : UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    var emojiChoices = ["👻","🎃","🦇","🐋","🐏","🍐","🎱","🚖","❤️"]
    
    var emoji = [Int:String]()
    //딕셔너리 생성
    
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
    }
}


