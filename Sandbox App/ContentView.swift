//
//  ContentView.swift
//  Sandbox App
//
//  Created by Adrian Mrówka on 16/01/2025.
//

import SwiftUI

struct ContentView: View {
    let icons = ["😎", "😃", "🥹", "🥳"]
    
    var body: some View {
        VStack {
            ForEach(icons, id: \.self) { item in
                CardView(emoji: item)
            }
        }
        .padding()
    }
}

struct CardView: View {
    var emoji = "😀"
    var text = "Card"
    
    @State
    var isSelected = false
    
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 8)
            if isSelected {
                baseRectangle
                    .foregroundColor(.white)
                baseRectangle
                    .strokeBorder(.black, lineWidth: 4)
                
                VStack {
                    Text(emoji)
                        .font(.largeTitle)
                    
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                }
            } else {
                baseRectangle
                    .foregroundColor(.blue)
                baseRectangle
                    .strokeBorder(.black, lineWidth: 4)
            }
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    ContentView()
}
