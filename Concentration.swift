//
//  Concentration.swift
//  Concenteration_Game
//
//  Created by MacOS on 3/15/1440 AH.
//  Copyright © 1440 AH Ahmed Eid. All rights reserved.
//

import Foundation

struct Concenteration
{
    // Create Array Form Struct Card
    private(set) var Cards = [Card]()
    
    
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            return Cards.indices.filter {Cards[$0].isFaceUp}.onlyOneFaceUp
            
//            let onlyCardFaceUp = Cards.indices.filter {Cards[$0].isFaceUp}
//            return onlyCardFaceUp.count == 1 ? onlyCardFaceUp.first : nil
//
//            var indexFounded : Int?
//            for index in Cards.indices{
//                if Cards[index].isFaceUp{
//                    if indexFounded == nil{
//                        indexFounded = index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return indexFounded
        }
        set(newValue) {
            for index in Cards.indices{
                Cards[index].isFaceUp = (index == newValue)
                
            }
            
        }
    }
    
    // this is cannot be priavte
    mutating func ChoosCard(at index:Int){
        assert(Cards.indices.contains(index), "Cards.indices not Conatain this index :\(index)")
        if !Cards[index].isMatched {
            if let matchCard = indexOfOneAndOnlyFaceUpCard , matchCard != index {
                if Cards[matchCard] == Cards[index]{
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
        assert(numberOfPairsOfCard > 0, "you must pass at least one PairsOfCard")
        for _ in 1...numberOfPairsOfCard{
            let card = Card()
            Cards += [card , card]
            //append card and its matches
        }
        
    }
}

extension Collection {
    var onlyOneFaceUp : Element? {
        return count == 1 ? first : nil
    }
}
