//
//  CoinDataService.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 26/12/2024.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var coinCancellable : AnyCancellable?
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
        
        
        print("get coins called ")
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
        coinCancellable = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder.init())
            .sink (receiveCompletion: NetworkingManager.handleCompletion,
                   receiveValue: { [weak self] result in
                self?.allCoins = result
                self?.coinCancellable?.cancel()
            })
    }
    
}
