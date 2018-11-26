//
//  ViewController.swift
//  Concenteration_Game
//
//  Created by MacOS on 3/15/1440 AH.
//  Copyright © 1440 AH Ahmed Eid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // model
    private lazy var game = Concenteration(numberOfPairsOfCard: numberOfPairsOfCard)
    
    // if readonly you can write it without get{}
    var numberOfPairsOfCard:Int{
        return (CardButtons.count + 1)/2
    }

    // read only
    private(set) var FlipCount = 0{didSet{FlipCountLable.text = "Flips :\(FlipCount)"}}
    
    
    @IBOutlet private var CardButtons: [UIButton]!
    @IBOutlet private weak var FlipCountLable: UILabel!
    @IBAction private func touchCard(_ sender: UIButton) {
        FlipCount += 1
        if let cardNumber = CardButtons.index(of: sender){
            game.ChoosCard(at: cardNumber)
            updataViewFromModel()
        }
        
    }
    private func updataViewFromModel(){
        for index in CardButtons.indices{
            let button = CardButtons[index]
            let card = game.Cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    private var emojiChoice = ["👻","🍇","🍐","🍎","🍋","🌎","☀️","🍀","🦀","🐫","🦅","🐿","🥦"]
    // Dic key is hashVlaue so, we must make Cars Class confirm Hashable Protocol
    private var emoji = [Card:String]()
    private func emoji(for card: Card) -> String{
        if emoji[card] == nil , emojiChoice.count > 0{
            emoji[card] = emojiChoice.remove(at: emojiChoice.count.arc4random)
        }
        return emoji[card] ?? "?"
    }
    
    
    //        return emoji[card.identifier] ?? "?" is ->
    //        if emoji[card.identifier] != nil{
    //            return emoji[card.identifier]!
    //        }
    //        else{
    //            return "?"
    //        }

}
// Extend Int to Have Var that make 5.arc4random == Int(arc4ranodme_uniform(UInt(emojiChoice.count)))

extension Int{
    var arc4random: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}

