//
//  HomeView-ViewModel.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 10/09/2025.
//

import Foundation

extension HomeView {
    @Observable
    class ViewModel {
        let savePath = URL.documentsDirectory.appending(path: "SavedDiceRolls")
        private(set) var previousRolls: [Dice]
        var dieNumber = 6
        
        init() {
            do {
                // try and load existing data and decode into the previousRolls array
                let data = try Data(contentsOf: savePath)
                previousRolls = try JSONDecoder().decode([Dice].self, from: data).sorted(by: >)
            } catch {
                previousRolls = []
            }
        }
        
        func rollNewNumber() {
            dieNumber = Int.random(in: 1...6)
            // save new instance of dice
            let dice = Dice(dieNumber: dieNumber)
            previousRolls.insert(dice, at: 0)
            save()
        }
        
        func deleteRoll(_ dice: Dice) {
            // remove Dice from array
            previousRolls.removeAll { $0.id == dice.id }
            save()
        }
        
        func save() {
            do {
                // try and convert data into raw JSON Data and save to "SavedDiceRolls" file
                let data = try JSONEncoder().encode(previousRolls)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
