//
//  DetailViewModel.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 22/02/2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject{
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    
    @Published var coin: CoinModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map({ (CoinDetailModel, coinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) in
                
                // Sobre - DetailView
                let price = coinModel.currentPrice.asCurrencyWith6Decimals()
                let pricePercentChange = coinModel.priceChangePercentage24H
                let priceStat = StatisticModel(title: "Preço Atual", value: price, percentageChange: pricePercentChange)
                
                
                
                let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
                let highStat = StatisticModel(title: "Máximo 24H", value: high)
                
                let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
                let lowStat = StatisticModel(title: "Mínimo 24H", value: low)
                
                let rank = "\(coinModel.rank)"
                let rankStat = StatisticModel(title: "Rank", value: rank)
                
                
                
                let overviewArray: [StatisticModel] = [
                    priceStat, highStat ,rankStat, lowStat
                ]
                
                //additional
                //let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
                //let highStat = StatisticModel(title: "Máximo 24H", value: high)
                
                //let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
                //let lowStat = StatisticModel(title: "Mínimo 24H", value: low)
                
                let marketCap = (coinModel.marketCap?.formatted() ?? "") + "€"
                let marketCapChange = coinModel.marketCapChangePercentage24H
                let marketCapStat = StatisticModel(title: "Capitalização de Mercado", value: marketCap, percentageChange: marketCapChange)
                
                //let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
                //let pricePercentageChange2 = coinModel.priceChangePercentage24H
                //let priceChangeStat = StatisticModel(title: "24H Price Change", value: priceChange, percentageChange: pricePercentageChange2)
                
                let volume = (coinModel.totalVolume?.formatted() ?? "") + "€"
                let volumeStat = StatisticModel(title: "Volume", value: volume)
                
                /*let marketCapChange = (coinModel.marketCapChange24H?.formatted() ?? "") + "€"
                let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
                let marketCapChangeStat = StatisticModel(title: "24H Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange2)*/
                
                /*let blockTime = CoinDetailModel?.blockTimeInMinutes ?? 0
                let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
                let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)*/
                
                /*let hashing = CoinDetailModel?.hashingAlgorithm ?? "n/a"
                let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)*/
                
                let additionalArray: [StatisticModel] =  [
                    volumeStat, marketCapStat, //priceChangeStat, blockStat, hashingStat
                ]
                
                
                return (overviewArray, additionalArray)
            })
            .sink{ [weak self] (returnedArrays) in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
    }
}
