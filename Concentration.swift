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
    private(set) var Cards = [Card]()
    
    
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            var indexFounded : Int?
            for index in Cards.indices{
                if Cards[index].isFaceUp{
                    if indexFounded == nil{
                        indexFounded = index
                    }else{
                        return nil
                    }
                }
            }
            return indexFounded
        }
        set(newValue) {
            for index in Cards.indices{
                Cards[index].isFaceUp = (index == newValue)
                
            }
            
        }
    }
    
    // this is cannot be priavte
    func ChoosCard(at index:Int){
        if !Cards[index].isMatched {
            if let matchCard = indexOfOneAndOnlyFaceUpCard , matchCard != index {
                if Cards[matchCard].identifier == Cards[index].identifier{
                    Cards[matchCard].isMatched = true
                    Cards[index].isMatched = true
                }
                Cards[index].isFaceUp = true
            }else{
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
