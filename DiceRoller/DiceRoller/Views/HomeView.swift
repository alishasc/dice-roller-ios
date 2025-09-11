//
//  HomeView.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 10/09/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "die.face.\(viewModel.dieNumber).fill")
                    .font(.system(size: 250))
                    .foregroundStyle(.yellow)
                    .sensoryFeedback(.selection, trigger: viewModel.dieNumber)
                    .onTapGesture {
                        viewModel.rollNewNumber()
                    }
            }
            .toolbar {
                // button to see previous roles
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        PreviousRollsView(previousRolls: viewModel.previousRolls) { diceToDelete in
                            viewModel.deleteRoll(diceToDelete)
                        }
                    } label: {
                        Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

