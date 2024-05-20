//
//  CircleButtonView.swift
//  CryptoTracker
//
//  Created by Michael on 20.05.2024.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconNmae: String
    
    var body: some View {
        Image(systemName: iconNmae)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
                )
            .shadow(color: Color.theme.accent.opacity(0.25),
                    radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}


struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconNmae: "info")
                .previewLayout(.sizeThatFits)
                
            CircleButtonView(iconNmae: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }

    }
}
