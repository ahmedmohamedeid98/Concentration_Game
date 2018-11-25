//
//  Concentration.swift
//  Concenteration_Game
//
//  Created by MacOS on 3/15/1440 AH.
//  Copyright © 1440 AH Ahmed Eid. All rights reserved.
//

import Foundation

class Concenteration
{
    // Create Array Form Struct Card
    var Cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int?
    func ChoosCard(at index:Int){
        if !Cards[index].isMatched {
            // check if cards matchs
            if let matchCard = indexOfOneAndOnlyFaceUpCard , matchCard != index {
                if Cards[matchCard].identifier == Cards[index].identifier{
                    Cards[matchCard].isMatched = true
                    Cards[index].isMatched = true
                }
                Cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
            //either no matchs nor two cards faceUp
            for FlipDownCard in Cards.indices{
                Cards[FlipDownCard].isFaceUp = false
            }
            Cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    }
    init(numberOfPairsOfCard:Int) {
        for _ in 1...numberOfPairsOfCard{
            let card = Card()
            Cards += [card , card]
            //append card and its matches
        }
        
    }
}
