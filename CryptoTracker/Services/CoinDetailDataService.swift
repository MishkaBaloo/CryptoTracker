//
//  CoinDetailDataService.swift
//  CryptoTracker
//
//  Created by Michael on 5/28/24.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    let coin: CoinModel
    
    var coinDetailSubscriptions: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinsDetails()
    }
        
     func getCoinsDetails() {
         guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false")
        else { return }
        
        coinDetailSubscriptions = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinsDetails in
                self?.coinDetails = returnedCoinsDetails
                self?.coinDetailSubscriptions?.cancel()

            })
    }
    
}
