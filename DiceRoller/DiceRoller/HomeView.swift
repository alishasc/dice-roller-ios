//
//  HomeView.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 10/09/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = ViewModel()
    @State private var dieNumber = 6
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "die.face.\(dieNumber).fill")
                    .font(.system(size: 250))
                    .foregroundStyle(.yellow)
                
                Button("Random") {
                    dieNumber = Int.random(in: 1...6)
                    // save new instance of dice
                    let dice = Dice(dieNumber: dieNumber)
                    viewModel.save(new: dice)
                }
            }
            .toolbar {
                ToolbarItem {
                    // button to see previous roles - new view
                    Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                    
//                    NavigationLink(destination: ListView(viewModel: viewModel), label: { Text("Previous Roles") })
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

