//
//  PreviousRollsView.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 11/09/2025.
//

import SwiftUI

struct PreviousRollsView: View {
    var previousRolls: [Dice]
    // add callback for deleting a roll
    var onDelete: (Dice) -> Void
    
    var body: some View {
        List {
            ForEach(previousRolls) { dice in
                HStack {
                    Image(systemName: "die.face.\(dice.dieNumber).fill")
                        .font(.system(size: 60))
                    Text("\(dice.formattedDate)")
                }
            }
            .onDelete { indexSet in
                // find index of Dice to remove
                for index in indexSet {
                    // find element from array
                    let diceToDelete = previousRolls[index]
                    // use callback to send Dice back to parent view
                    onDelete(diceToDelete)
                }
            }
        }
    }
}

#Preview {
    PreviousRollsView(previousRolls: [.example, .example], onDelete: { _ in })
}
