//
//  Model.swift
//  iOS_Study
//
//  Created by 김응관 on 2021/10/10.
//

//UI파일이 아님
import Foundation


//클래스를 만들고나면 항상 이것의 공개 API가 무엇인지 생각해야 한다.
//API => 클래스 안의 모든 메소드와 인스턴스 변수의 리스트이다.
class iOS_Study
{
    var cards =  [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards { //..미만, ...이하
            let card = Card()
            cards += [card, card]
        }
        //shuffle
    }
}
