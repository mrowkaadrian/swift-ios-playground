//
//  ContentView.swift
//  Sandbox App
//
//  Created by Adrian Mrówka on 16/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView(emoji: "😎", isSelected: true)
            CardView(isSelected: true)
        }
        .padding()
    }
}

struct CardView: View {
    var emoji: String = "😀"
    var text: String = "Card"
    var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            if isSelected {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(8)
                Rectangle()
                    .strokeBorder(.black, lineWidth: 4)
                    .cornerRadius(8)
                
                VStack {
                    Text(emoji)
                        .font(.largeTitle)
                    
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                }
            } else {
                Rectangle()
                    .foregroundColor(.blue)
                    .cornerRadius(8)
                Rectangle()
                    .strokeBorder(.black, lineWidth: 4)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    ContentView()
}
