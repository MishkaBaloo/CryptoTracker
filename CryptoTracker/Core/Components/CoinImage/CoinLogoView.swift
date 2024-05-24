//
//  CoinLogoView.swift
//  CryptoTracker
//
//  Created by Michael on 5/24/24.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinLogoView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            CoinLogoView(coin: DeveloperPreview.instance.coin)
                .previewLayout(.sizeThatFits)
//                .preferredColorScheme(.light)
        }
    }
}
