//
//  CoinRowView.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 17/02/2023.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            rightColumn
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
    }
    
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
                .background(Color.theme.background)
        }
        
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.SecundaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.SecundaryText)
        }
        
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.SecundaryText)
                .frame(width: 90, height: 20)
                .padding(.top, 20)
            Text(coin.priceChangePercentage24H!.asPercentString())
                .foregroundColor(
                    coin.priceChangePercentage24H ?? 0 >= 0 ?
                    Color.green :
                    Color.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 6, alignment: .trailing)
    }
}


/*private var centerColumn: some View {
    VStack(alignment: .trailing){
        Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            .bold()
        Text((coin.currentHoldings ?? 0).asNumberString())
    }
    .foregroundColor(Color.theme.SecundaryText)
}*/
