//
//  PreviewProvider.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 24/12/2024.
//

import SwiftUI

extension PreviewProvider {
    static var dev : DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    
    static let instance = DeveloperPreview()
    
    let homeViewModel = HomeViewModel()
    
    private init(){}
    
    let coin = CoinModel(id: "bitcoin",
                         symbol: "btc",
                         name: "Bitcoin",
                         image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
                         currentPrice: 98861,
                         marketCap: 1956158328868,
                         marketCapRank: 1,
                         fullyDilutedValuation: 2074653549447,
                         totalVolume: 54742002998,
                         high24H: 98882,
                         low24H: 92442,
                         priceChange24H: 5171.8,
                         priceChangePercentage24H: 5.5202,
                         marketCapChange24H: 103224623279,
                         marketCapChangePercentage24H: 5.57088,
                         circulatingSupply: 19800571,
                         totalSupply: 21000000,
                         maxSupply: 21000000,
                         ath: 108135,
                         athChangePercentage: -8.56295,
                         athDate: "2024-12-17T15:02:41.429Z",
                         atl: 67.81,
                         atlChangePercentage: 145714.24029,
                         atlDate: "2013-07-06T00:00:00.000Z",
                         lastUpdated: "2024-12-24T17:26:56.563Z",
                         sparklineIn7D: SparklineIn7D(price: [106620.368592256, 106495.851999691, 106867.016361596, 106437.506543884, 105991.357251276, 106034.913402645, 106149.113400295, 105190.792068245, 105319.256782724, 104741.062915471, 103848.148629144, 103581.164917386, 103745.293900757, 104220.262628561, 103784.927218399, 104018.510392272, 104503.224036199, 105037.057303081, 104983.481291607, 104661.925494947, 103821.249178899, 104432.307228023, 104094.33900138, 104678.011449326, 104758.834691005, 102841.524821776, 100808.599297841, 101086.855814698, 101083.027791377, 100590.406742413, 100600.051648797, 99633.6467036961, 100551.464736805, 101108.110657244, 100726.401144543, 101258.803872745, 101127.784397697, 101633.081546774, 101673.239994366, 101744.02466948, 102392.354753159, 102387.297922233, 101909.814249702, 101863.069270146, 101197.407100025, 100551.818014283, 100586.345455708, 98143.2079733104, 98759.7378515825, 97157.3241180719, 96448.901752501, 97634.6174442195, 98136.5193271677, 97851.3537707581, 97198.7968509462, 96029.7899967946, 97516.2050419872, 97026.8582608009]),
                         priceChangePercentage24HInCurrency: 5.52019547639183,
                         currentHolding: 1.5
                         )
    
    let statistic1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let statistic2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
    
}
