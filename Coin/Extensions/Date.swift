//
//  Date.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 22/02/2023.
//

import Foundation

extension Date {
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let data = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: data)
    }
    
    private var showFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return showFormatter.string(from: self)
    }
}
