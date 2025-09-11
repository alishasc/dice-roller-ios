//
//  SettingsView-ViewModel.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 11/09/2025.
//

import Foundation
import SwiftUI

extension SettingsView {
    @Observable
    class ViewModel {
        // MARK: save this data to @AppStorage?
        var diceColor = Color.yellow
        var backgroundColor = Color.yellow
        let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .pink, .white]
    }
}
