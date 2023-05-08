//
//  DetailView.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 22/02/2023.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Intiliazing Detail View for \(coin.name)")
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text(vm.coin.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                graficoView(coin: vm.coin)

                
                Text("Sobre")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: [],
                    content: {
                        ForEach(vm.overviewStatistics){ stat in
                            StatisticView(stat: stat)
                        }
                    }
                )
                
                Text("Informações adicionais")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.white)
                Divider()
                
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: [],
                    content: {
                        ForEach(vm.additionalStatistics){ stat in
                            StatisticView(stat: stat)
                        }
                    })
                
            }
            .padding()
        }
        //.navigationTitle(vm.coin.name)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                HStack {
                    Text(vm.coin.symbol.uppercased())
                        .font(.headline)
                        .foregroundColor(Color.theme.SecundaryText)
                    CoinImageView(coin: vm.coin)
                        .frame(width: 25, height: 25)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(coin: dev.coin)
                .background(Color.theme.background)
                .foregroundColor(Color.theme.accent)
        }
    }
}

