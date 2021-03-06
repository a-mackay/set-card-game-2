//
//  Set.swift
//  set
//
//  Created by Anthony Mackay on 11/11/18.
//  Copyright © 2018 Anthony Mackay. All rights reserved.
//

import Foundation

class SetGame {
    private var deck = Card.createDefaultDeckOfCards().shuffled()
    var cardsInPlay: [Card] = []
    private var selectedCards: [Card] = []
    private(set) var score: Int = 0
    
    func hasAMatch() -> Bool {
        return SetGame.hasAMatch(selectedCards: self.selectedCards)
    }
    
    private static func hasAMatch(selectedCards: [Card]) -> Bool {
        if selectedCards.count == 3 {
            let firstCard = selectedCards[0]
            let secondCard = selectedCards[1]
            let thirdCard = selectedCards[2]
            let numberOfAttributes = firstCard.attributes.count
            for attributeIndex in 0..<numberOfAttributes {
                let firstAttribute = firstCard.attributes[attributeIndex]
                let secondAttribute = secondCard.attributes[attributeIndex]
                let thirdAttribute = thirdCard.attributes[attributeIndex]
                let attributeOptions = [firstAttribute, secondAttribute, thirdAttribute]
                if !allEqual(attributeOptions) && !allUnequal(attributeOptions) {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
    
    private static func allEqual(_ attributeOptions: [Int]) -> Bool {
        if attributeOptions.isEmpty {
            preconditionFailure("attributeOptions cannot be empty")
        }
        let set = Set(attributeOptions)
        return set.count == 1
    }
    
    private static func allUnequal(_ attributeOptions: [Int]) -> Bool {
        if attributeOptions.isEmpty {
            preconditionFailure("attributeOptions cannot be empty")
        }
        let set = Set(attributeOptions)
        return set.count == 3
    }
    
    private func dealCards(numberOfCards: Int) {
        for _ in 1...numberOfCards {
            if deck.count > 0 {
                let dealtCard = deck.remove(at: 0)
                cardsInPlay.append(dealtCard)
            }
        }
    }
    
    func dealThreeCards() {
        dealCards(numberOfCards: 3)
    }
    
    func touchCard(atIndex index: Int) {
        if !cardsInPlay.indices.contains(index) {
            preconditionFailure("Index is not in the indices of the cards in play")
        }
        
        let touchedCard = cardsInPlay[index]

        if hasAMatch() {
            cardsInPlay.remove(elements: selectedCards)
            dealThreeCards()
            score = score + 1
        } else if selectedCards.count == 3 {
            selectedCards.removeAll()
            selectedCards.append(touchedCard)
            score = score - 5
        } else {
            if let index = selectedCards.index(of: touchedCard) {
                selectedCards.remove(at: index)
            } else {
                selectedCards.append(touchedCard)
            }
        }
    }
}

extension Array where Element: Equatable {
    mutating func remove(elements: [Element]) {
        for element in elements {
            if let index = self.index(of: element) {
                self.remove(at: index)
            } else {
                preconditionFailure("Element \(element) was not in array")
            }
        }
    }
}
