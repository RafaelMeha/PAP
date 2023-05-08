//
//  ContentView.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @EnvironmentObject private var vm: HomeViewModel
    
    static let gradient = Gradient(colors: [Color.theme.accent, Color.theme.accent])
    static let linearGradient = LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
    
    
    var body: some View {
        VStack{
            homeHeader
            NavigationView {
                VStack {
                    switch selection {
                    case 0:
                        DashboardView()
                    case 1:
                        WalletView()
                    case 2:
                        ProfileView()
                    default:
                        DashboardView()
                    }
                    
                    Spacer()
                    ZStack{
                        ContentView.linearGradient
                            .frame(height: 60)
                            .cornerRadius(21)
                            .shadow(radius: 10)
                        HStack {
                            Button(action: {
                                self.selection = 0
                            }) {
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .foregroundColor(self.selection == 0 ? Color.yellow : Color.white)
                                    .font(.system(size: 25))
                            }
                            Spacer()
                            Button(action: {
                                self.selection = 1
                            }) {
                                Image(systemName: "arrow.left.arrow.right")
                                    .foregroundColor(self.selection == 1 ? Color.yellow : Color.white)
                                    .font(.system(size: 25))
                            }
                        
                            Spacer()
                            Button(action: {
                                self.selection = 2
                            }) {
                                Image(systemName: "person.fill")
                                    .foregroundColor(self.selection == 2 ? Color.yellow : Color.white)
                                    .font(.system(size: 25))
                            }
                        }
                        .padding(15)
                    }
                    .padding(5)
                    .background(Color.theme.background)
                }
                .background(Color.theme.background)
            }
            .padding(0)
        }
    }
}

extension ContentView{
    private var homeHeader: some View {
        HStack{
            NavigationLink {
                DashboardView()
            }label: {
                CircleButtonView(iconName: "person.fill")
                    .foregroundColor(Color.white)
            }
            Spacer()
            
            SearchBarView(searchText: $vm.searchText)
               .foregroundColor(Color.white)
        }
        .background(Color.theme.background)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(Color.theme.background)
    }
}
