//
//  MarketDataModel.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 28/12/2024.
//

import Foundation

/*
 https://api.coingecko.com/api/v3/global
 
 {
   "data": {
     "active_cryptocurrencies": 16354,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1200,
     "total_market_cap": {
       "btc": 36622325.4447797,
       "eth": 1023534963.51523,
       "ltc": 34607369235.4939,
       "bch": 7777803295.22474,
       "bnb": 4786294536.51781,
       "eos": 4358198699267.71,
       "xrp": 1588770067997.16,
       "xlm": 9865945727525.21,
       "link": 159003359598.987,
       "dot": 493274945709.422,
       "yfi": 397048233.618983,
       "usd": 3475824114142.4,
       "aed": 12766632454762.7,
       "ars": 3.58079514593563e+15,
       "aud": 5592010109555.71,
       "bdt": 415938806116575,
       "bhd": 1310788886628.92,
       "bmd": 3475824114142.4,
       "brl": 21535337255197.8,
       "cad": 5011964581387.63,
       "chf": 3135763386111.16,
       "clp": 3.45187568599596e+15,
       "cny": 25369345044302.5,
       "czk": 84030133453860.9,
       "dkk": 24860831976403.5,
       "eur": 3333165865025.65,
       "gbp": 2764733065222.92,
       "gel": 9732196293227.06,
       "hkd": 26980563312413.2,
       "huf": 1368727398787564,
       "idr": 56256213287394700,
       "ils": 12799652783847.1,
       "inr": 296820607095276,
       "jpy": 548742275869281,
       "krw": 5122661668447379,
       "kwd": 1070734570009.79,
       "lkr": 1.01792823728535e+15,
       "mmk": 7292278991470747,
       "mxn": 70653771932995.3,
       "myr": 15542147526387.7,
       "ngn": 5388512272538402,
       "nok": 39562420957268.2,
       "nzd": 6167186008139.88,
       "php": 201312781042899,
       "pkr": 968731217700159,
       "pln": 14237848003379.9,
       "rub": 367482554166587,
       "sar": 13056756017746.1,
       "sek": 38237714870886.2,
       "sgd": 4722602223885.27,
       "thb": 118421042551254,
       "try": 122140455895140,
       "twd": 114088712810553,
       "uah": 146037612160073,
       "vef": 348034268549.078,
       "vnd": 88477144479770900,
       "zar": 64986458094006.7,
       "xdr": 2668581342753.4,
       "xag": 118376593712.482,
       "xau": 1325748833.61619,
       "bits": 36622325444779.7,
       "sats": 3.66223254447797e+15
     },
     "total_volume": {
       "btc": 1057195.49021606,
       "eth": 29546909.8252199,
       "ltc": 999028713.760212,
       "bch": 224525845.031266,
       "bnb": 138168424.243897,
       "eos": 125810361695.316,
       "xrp": 45863842082.0512,
       "xlm": 284805325800.053,
       "link": 4590031699.39917,
       "dot": 14239621370.4913,
       "yfi": 11461795.4180207,
       "usd": 100338401060.749,
       "aed": 368540940328.109,
       "ars": 103368653784117,
       "aud": 161427429778.564,
       "bdt": 12007119282890.2,
       "bhd": 37839216454.4253,
       "bmd": 100338401060.749,
       "brl": 621671648372.134,
       "cad": 144682957409.547,
       "chf": 90521693254.5693,
       "clp": 99647069477440.2,
       "cny": 732349921662.193,
       "czk": 2425741048684.24,
       "dkk": 717670413587.005,
       "eur": 96220212066.0124,
       "gbp": 79810970294.9386,
       "gel": 280944312141.262,
       "hkd": 778861787473.903,
       "huf": 39511757261706.9,
       "idr": 1623977021168218,
       "ils": 369494155138.186,
       "inr": 8568473012383.43,
       "jpy": 15840825296980,
       "krw": 147878507113131,
       "kwd": 30909445123.5658,
       "lkr": 29385057577632.8,
       "mmk": 210509965425451,
       "mxn": 2039598746042.05,
       "myr": 448663160343.138,
       "ngn": 155552953132131,
       "nok": 1142068738401.62,
       "nzd": 178031328047.696,
       "php": 5811399512636.44,
       "pkr": 27964861929053.3,
       "pln": 411011275683.493,
       "rub": 10608307754344.8,
       "sar": 376916086326.249,
       "sek": 1103827766989.35,
       "sgd": 136329785521.239,
       "thb": 3418521096390.82,
       "try": 3525891312936.31,
       "twd": 3293457507217.49,
       "uah": 4215742804490.82,
       "vef": 10046884098.2128,
       "vnd": 2.55411520145676e+15,
       "zar": 1875997484804.51,
       "xdr": 77035309106.3951,
       "xag": 3417237968.91806,
       "xau": 38271072.9325908,
       "bits": 1057195490216.06,
       "sats": 105719549021606
     },
     "market_cap_percentage": {
       "btc": 54.0720878849126,
       "eth": 11.7703829054729,
       "usdt": 3.9950334336343,
       "xrp": 3.61350053043985,
       "bnb": 3.04852718560084,
       "sol": 2.66013651224854,
       "doge": 1.36480935571809,
       "usdc": 1.2550751782257,
       "steth": 0.94358888310759,
       "ada": 0.911148265232368
     },
     "market_cap_change_percentage_24h_usd": -0.715861896101728,
     "updated_at": 1735419176
   }
 }
 
 
 */

struct MarketDataModel: Codable {
    let data: MarketData?
}

// MARK: - DataClass
struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap : String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume : String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}
