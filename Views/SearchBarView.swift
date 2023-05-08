//
//  SearchBarView.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 16/02/2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding  var searchText: String
    
    var body: some View {
        HStack{
            
            TextField("Procure por nome ou símbolo...", text: $searchText)
                .foregroundColor(Color.theme.SecundaryText)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.SecundaryText)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    ,alignment: .trailing
                )
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ?
                    Color.theme.SecundaryText : Color.theme.SecundaryText
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.gray.opacity(0.15),
                    radius: 10, x: 0, y: 0
                )
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            SearchBarView(searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
