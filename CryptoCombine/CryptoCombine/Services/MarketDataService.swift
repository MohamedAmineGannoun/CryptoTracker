//
//  MarketDataService.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 03/01/2025.
//

import SwiftUI
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel?
    var coinCancellable : AnyCancellable?
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
        
        
        print("get coins called ")
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        coinCancellable = NetworkingManager.download(url: url)
            .decode(type: MarketDataModel.self, decoder: JSONDecoder.init())
            .sink (receiveCompletion: NetworkingManager.handleCompletion,
                   receiveValue: { [weak self] result in
                self?.marketData = result
                self?.coinCancellable?.cancel()
            })
    }
    
}
