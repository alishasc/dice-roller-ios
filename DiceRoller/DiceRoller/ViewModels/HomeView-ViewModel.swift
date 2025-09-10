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
        let savePath = URL.documentsDirectory.appending(path: "SavedDiceRoles")
        private(set) var previousRoles: [Dice]
        
        init() {
            do {
                // try and load existing data and decode into the previousRolls array
                let data = try Data(contentsOf: savePath)
                previousRoles = try JSONDecoder().decode([Dice].self, from: data)
            } catch {
                previousRoles = []
            }
        }
        
        func save(new dice: Dice) {
            do {
                previousRoles.append(dice)
                
                // try and convert data into raw JSON Data and save to "SavedDiceRolls" file
                let data = try JSONEncoder().encode(previousRoles)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
