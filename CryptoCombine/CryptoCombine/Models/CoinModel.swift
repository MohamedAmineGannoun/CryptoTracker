//
//  CoinModel.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 24/12/2024.
//

import Foundation

struct CoinModel : Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice : Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHolding : Double?
    
    enum CodingKeys : String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHolding
    }
    
    func updateHoldings(amount: Double) -> CoinModel{
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHolding: amount)
    }
    
    var currentHoldingsValue : Double {
        (currentHolding ?? 0) * currentPrice
    }
    
    var rank : Int {
        Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D : Codable{
    let price: [Double]?
}

/*
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 98861,
 "market_cap": 1956158328868,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 2074653549447,
 "total_volume": 54742002998,
 "high_24h": 98882,
 "low_24h": 92442,
 "price_change_24h": 5171.8,
 "price_change_percentage_24h": 5.5202,
 "market_cap_change_24h": 103224623279,
 "market_cap_change_percentage_24h": 5.57088,
 "circulating_supply": 19800571,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 108135,
 "ath_change_percentage": -8.56295,
 "ath_date": "2024-12-17T15:02:41.429Z",
 "atl": 67.81,
 "atl_change_percentage": 145714.24029,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2024-12-24T17:26:56.563Z",
 "sparkline_in_7d": {
 "price": [106759.84150362, 107144.069682933]
 },
 "price_change_percentage_24h_in_currency": 5.52019547639183
 }
 
 */
