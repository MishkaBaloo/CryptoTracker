//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by Michael on 5/21/24.
//

import Foundation
import Combine


class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscriptions: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
        
        coinSubscriptions = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscriptions?.cancel()

            })
    }
    
}
