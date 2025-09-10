//
//  Dice.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 10/09/2025.
//

import Foundation

struct Dice: Codable, Identifiable {
    var id = UUID()
    var dieNumber: Int
    var dateRolled = Date.now
}
