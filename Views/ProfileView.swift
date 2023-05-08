//
//  ProfileView.swift
//  CryptoEarn
//
//  Created by Rafael Meha on 15/02/2023.
//

import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let title: String
    let body: String
    let time: Date
}

struct Transaction: Identifiable {
    let id = UUID()
    let symbol: String
    let amount: Double
    let price: Double
    let date: Date
    let description: String
}

struct ProfileView: View {
    @State var balance: Double = 0.0
    @State var recentTransactions: [Transaction] = []
    @State var notifications: [Notification] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Dashboard")
                    .font(.title)
                    .bold()
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Account Balance")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("$\(balance, specifier: "%.2f")")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        // Show all transactions
                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.top, 20)
                
                Divider()
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Recent Transactions")
                        .font(.headline)
                        .padding(.leading, 20)
                        .foregroundColor(.white)
                    
                    ForEach(recentTransactions.prefix(3)) { transaction in
                        TransactionRowView(transaction: transaction)
                    }
                    
                    Button(action: {
                        // Show all transactions
                    }) {
                        Text("See all")
                            .foregroundColor(.blue)
                            .padding(.leading, 20)
                    }
                }
                .padding(.top, 20)
                
                Divider()
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Notifications")
                        .font(.headline)
                        .padding(.leading, 20)
                        .foregroundColor(.white)
                    
                    ForEach(notifications.prefix(3)) { notification in
                        NotificationRowView(notification: notification)
                    }
                    
                    Button(action: {
                        // Show all notifications
                    }) {
                        Text("See all")
                            .foregroundColor(.blue)
                            .padding(.leading, 20)
                    }
                }
                .padding(.top, 20)
            }
        }
    }
}

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
                .padding(.leading, 20)
            
            VStack(alignment: .leading) {
                Text(transaction.description)
                    .font(.headline)
                Text("\(transaction.date, formatter: DateFormatter.shortDateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("$\(transaction.amount, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.green)
                .padding(.trailing, 20)
        }
        .padding(.vertical, 8)
    }
}

struct NotificationRowView: View {
    let notification: Notification
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
                .padding(.leading, 20)
            
            VStack(alignment: .leading) {
                Text(notification.title)
                    .font(.headline)
                Text(notification.body)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("\(notification.time, formatter: DateFormatter.shortTimeFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.trailing, 20)
        }
        .padding(.vertical, 8)
    }
}

extension DateFormatter {
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    static let shortTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
