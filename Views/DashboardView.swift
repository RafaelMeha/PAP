//
//  ContentView.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 15/02/2023.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var selectedCoins: CoinModel? = nil
    @State private var showDataView: Bool = false
    var body: some View {
        allCoinList
    }
}

extension DashboardView{
    private var allCoinList: some View{
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
        .background(Color.theme.background)
    }

    private func segue(coin: CoinModel) {
        selectedCoins = coin
        showDataView.toggle()
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
