//
//  Card.swift
//  iOS_Study
//
//  Created by 김응관 on 2021/10/11.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //이모지는 UI부분이므로 모델 부분에서는 필요가 없다
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
