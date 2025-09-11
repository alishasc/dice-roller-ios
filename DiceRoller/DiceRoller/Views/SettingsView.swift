//
//  SettingsView.swift
//  DiceRoller
//
//  Created by Alisha Carrington on 11/09/2025.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            viewModel.backgroundColor.opacity(0.7)
                .ignoresSafeArea()
            
            Form {
                Section("Dice Settings") {
                    // num of die faces
                    // how many dice
                }
                
                Section("Appearance") {
                    // dice color
                    HStack {
                        ForEach(viewModel.colors.indices, id: \.self) { color in
                            colorOptions(currentColor: $viewModel.diceColor, color: viewModel.colors[color], isBackground: false)
                        }
                    }
                    
                    // background color
                    HStack {
                        ForEach(viewModel.colors.indices, id: \.self) { color in
                            colorOptions(currentColor: $viewModel.backgroundColor, color: viewModel.colors[color], isBackground: true)
                        }
                    }
                }
                
                Text("Current dice color is \(viewModel.diceColor)")
                Text("Current background color is \(viewModel.backgroundColor)")
            }
            .navigationTitle("Settings")
            .scrollContentBackground(.hidden)
        }
    }
}

struct colorOptions: View {
    @Binding var currentColor: Color
    var color: Color
    var isBackground: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 40, height: 40)
            .foregroundStyle(isBackground ? AnyShapeStyle(color.gradient) : AnyShapeStyle(color))
            .opacity(isBackground ? 0.7 : 1)
            .overlay( // apply rounded border
                RoundedRectangle(cornerRadius: 10)
                // add permanent gray stroke to the white square
                    .stroke(color == Color.white ? Color.gray : Color.clear)
                // selected colors will have black stroke
                    .stroke(currentColor == color ? Color.black : Color.clear, lineWidth: 2)
            )
            .onTapGesture {
                currentColor = color
            }
    }
}

#Preview {
    SettingsView()
}
