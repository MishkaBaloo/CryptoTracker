//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Michael on 20.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary Text color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red color")
                    .foregroundStyle(Color.theme.red)
                
                Text("Green color")
                    .foregroundStyle(Color.theme.green)
            }
            .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
