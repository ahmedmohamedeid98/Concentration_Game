//
//  Card.swift
//  Concenteration_Game
//
//  Created by MacOS on 3/15/1440 AH.
//  Copyright © 1440 AH Ahmed Eid. All rights reserved.
//

import Foundation

// the main diff between ( struct - class ) is
// the struct no inheritance
// the struct ( value type ) the class ( reference type)

// Why we don't add var emojin in card ?
// ans: becouse it is a data and the model must not contain data
// model id independent from view
struct Card
{
    var isFaceUp = false
    var isMatched = false
    private(set) var identifier : Int
    
    private static var uniqueIdentifier = 0
    
    private static func getUniqueIdentifier() -> Int {
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
