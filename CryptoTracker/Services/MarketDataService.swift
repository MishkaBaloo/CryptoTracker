//
//  MarketDataService.swift
//  CryptoTracker
//
//  Created by Michael on 5/24/24.
//

import Foundation
import Combine


class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscriptions: AnyCancellable?
    
    init() {
        getData()
    }
    
     func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscriptions = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscriptions?.cancel()

            })
    }
    
}
