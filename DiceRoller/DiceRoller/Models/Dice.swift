//
//  Dice.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 10/09/2025.
//

import Foundation

struct Dice: Codable, Comparable, Identifiable {
#if DEBUG
    static let example = Dice(dieNumber: 4)
#endif
    
    var id = UUID()
    var dieNumber: Int
    var dateRolled = Date.now
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E d MMM, hh:mm"
        return formatter.string(from: dateRolled)
    }
    
    static func < (lhs: Dice, rhs: Dice) -> Bool {
        lhs.dateRolled < rhs.dateRolled
    }
}
