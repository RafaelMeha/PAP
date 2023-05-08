//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Rafael Meha on 27/10/2022.
//

import Foundation

//CoinGecko API info
/*q
    :
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON response:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 20603,
     "market_cap": 393550723362,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 430653737096,
     "total_volume": 45677955487,
     "high_24h": 20819,
     "low_24h": 20417,
     "price_change_24h": 49.71,
     "price_change_percentage_24h": 0.24188,
     "market_cap_change_24h": -832631731.6697388,
     "market_cap_change_percentage_24h": -0.21112,
     "circulating_supply": 19190743,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 59717,
     "ath_change_percentage": -65.65954,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 51.3,
     "atl_change_percentage": 39875.96156,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-10-27T12:33:29.219Z",
     "sparkline_in_7d": {
       "price": [
         19211.710244395486,
         19167.0205623987,
         19173.600589760783,
         19305.345930702806,
         19278.01215631998,
         19174.72650217006,
         19094.910315802168,
         19067.54090824143,
         19046.100355685714,
         19048.21571545648,
         19081.254204142453,
         19024.33368591166,
         19068.872653807117,
         19053.952268337078,
         19069.139247447227,
         19116.49366478781,
         19048.79214728447,
         19037.475457917353,
         19041.45987172357,
         19045.28974479827,
         19039.169606947078,
         18977.818414279067,
         19001.398886231764,
         18983.653149999704,
         18957.66784989103,
         18788.33090984761,
         18995.590029045874,
         19008.95035584781,
         19093.96376768533,
         19166.050380261637,
         19140.93115709804,
         19140.648902301014,
         19217.74515555127,
         19169.904447890876,
         19149.043460326095,
         19185.608127888943,
         19173.28046885863,
         19162.456197530275,
         19159.096331560944,
         19122.754394367166,
         19140.467403715713,
         19153.367012398685,
         19147.978338144996,
         19147.912718461987,
         19162.857528130895,
         19162.393431006658,
         19167.653121749103,
         19164.461945980023,
         19186.278943226564,
         19194.7968175857,
         19195.10241194606,
         19223.491491827943,
         19226.74239657363,
         19184.3925726527,
         19152.182141188052,
         19176.601906953063,
         19180.35493030478,
         19197.31005212439,
         19211.553782510684,
         19202.461867913724,
         19203.86547117714,
         19205.37843987457,
         19177.46653603603,
         19205.026756695916,
         19199.11037110921,
         19184.737271874732,
         19184.678527629098,
         19176.899822720254,
         19166.7414759112,
         19179.277823313994,
         19182.56114475555,
         19171.79783203801,
         19152.052327033176,
         19136.440929811495,
         19159.157029772898,
         19191.032018269118,
         19187.355913963704,
         19189.650925966234,
         19270.757718768746,
         19440.59089857329,
         19484.67555997737,
         19487.97949117075,
         19480.613211589334,
         19631.765116538194,
         19574.824231840797,
         19523.925287327496,
         19397.864155825613,
         19453.323421472585,
         19392.06179827693,
         19308.58758313927,
         19324.856554251972,
         19344.40199029475,
         19294.53762454735,
         19339.94011206038,
         19365.825956725577,
         19381.156335687832,
         19445.525176709027,
         19357.662700889403,
         19377.108301670345,
         19260.457427469257,
         19298.522499827588,
         19275.5170688192,
         19290.976376002993,
         19323.535606343114,
         19338.21954455155,
         19348.282096173825,
         19363.83479186489,
         19350.700573130875,
         19316.94062294213,
         19327.103330183803,
         19299.98826751201,
         19297.16326285081,
         19341.12698783663,
         19337.911981543893,
         19325.509905402632,
         19331.151712503324,
         19298.580174703384,
         19303.137381114342,
         19278.628402980143,
         19285.602556850554,
         19304.731979883796,
         19294.532922750837,
         19433.055587085553,
         19474.98930155096,
         19911.706066380186,
         19760.326656193,
         20045.499175515517,
         20295.75489657272,
         20218.874995039227,
         20146.820945638334,
         20205.80043641026,
         20036.39480045612,
         20095.152230674925,
         20157.355430425745,
         20250.8114175124,
         20195.387343050614,
         20274.794813381053,
         20252.61840977452,
         20167.177518102373,
         20229.832488617205,
         20304.52520756891,
         20650.68178738809,
         20617.016249528224,
         20648.92562073602,
         20625.831747372926,
         20544.905748794776,
         20521.943694795453,
         20854.142068942485,
         20854.142068942485,
         20866.243542173965,
         20805.224584969154,
         20742.686085175465,
         20661.856055562006,
         20733.499896357825,
         20743.378107020082,
         20735.73950706507,
         20771.826955711713,
         20774.247496426033,
         20744.64372449598,
         20730.52160079306,
         20775.832461013237,
         20741.61334021924,
         20822.4053655581,
         20850.067442123476,
         20732.188687989827,
         20698.751551664875,
         20716.30788760802,
         20617.90912075895,
         20493.398123308543
       ]
     },
     "price_change_percentage_24h_in_currency": 0.24187691547874904
*/

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
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
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
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
        case athChangePercentage = "ath_change_percentge"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
