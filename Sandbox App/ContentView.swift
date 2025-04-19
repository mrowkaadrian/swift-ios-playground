//
//  ContentView.swift
//  Sandbox App
//
//  Created by Adrian Mrówka on 16/01/2025.
//

import SwiftUI

struct ContentView: View {
    let theme1 = ["🐶", "🐱", "🐭", "🐹", "🐰", "🐻", "🐼", "🐨", "🐵", "🐔", "🐦", "🐧"]
    let theme2 = ["🔴", "⚫️", "🔵", "⚪️", "🟢", "🟤", "🟡", "🟣", "🟠"]
    let theme3 = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐"]
    
    enum Theme: String, CaseIterable, Identifiable {
        case animals, circles, vehicles
        var id: Self { self }
    }
    
    @State var count: Int = 3
    @State var selectedTheme: Theme = .animals
    
    var icons: [String] {
        switch selectedTheme {
        case .animals:
            return theme1.shuffled()
        case .circles:
            return theme2.shuffled()
        case .vehicles:
            return theme3.shuffled()
        }
    }
    
    var body: some View {
        title
        VStack {
            ScrollView {
                cardList
            }
            Spacer()
            cardButtons
        }
        .padding()
    }
    
    var title: some View {
        Text("Card App").font(.title)
    }
    
    var cardList: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<count, id: \.self) { index in
                CardView(icon: icons[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardButtons: some View {
        HStack {
            cardCardAdjuster(by: -1, symbol: "minus.circle")
            Spacer()
            themeSelector
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
        .disabled(count + offset < 1 || count + offset > icons.count)
    }
    
    var themeSelector: some View {
        Picker("Theme", selection: $selectedTheme) {
            Text("Animals").tag(Theme.animals)
            Text("Circles").tag(Theme.circles)
            Text("Vehicles").tag(Theme.vehicles)
        }
    }
    
}

struct CardView: View {
    var icon = "😀"
    var text = "Card"
    
    @State
    var isSelected = false
    
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
