//
//  ContentView.swift
//  Sandbox App
//
//  Created by Adrian Mrówka on 16/01/2025.
//

import SwiftUI

struct ContentView: View {
    let icons = ["🔴", "⚫️", "🔵", "⚪️", "🟢", "🟤", "🟡", "🟣", "🟠"]
    
    @State
    var count: Int = 3
    
    var body: some View {
        VStack {
            ScrollView {
                cardList
            }
            Spacer()
            cardButtons
        }
        .padding()
    }
    
    var cardList: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<count, id: \.self) { item in
                CardView(icon: icons[Int.random(in: 0..<icons.count)])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardButtons: some View {
        HStack {
            cardCardAdjuster(by: -1, symbol: "minus.circle")
            Spacer()
            cardCardAdjuster(by: 1, symbol: "plus.circle")
        }
        .imageScale(.large)
    }
    
    func cardCardAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            count += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(count + offset < 1)
    }
}

struct CardView: View {
    var icon = "😀"
    var text = "Card"
    
    @State
    var isSelected = true
    
    var body: some View {
        ZStack {
            let baseRectangle = RoundedRectangle(cornerRadius: 8)
            
            baseRectangle.foregroundColor(.white)
            baseRectangle.strokeBorder(.black, lineWidth: 4)

            VStack {
                Text(icon)
                    .font(.largeTitle)
                
                Text(text)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
            }
            
            baseRectangle.fill(.black).opacity(isSelected ? 0 : 1)
        }
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    ContentView()
}
