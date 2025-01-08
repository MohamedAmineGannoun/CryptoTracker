//
//  SettingsView.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 08/01/2025.
//

import SwiftUI

struct SettingsView: View {
    
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationStack{
            List{
                coinGeckoSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
                
                developerSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }

        }
        .navigationTitle("Settings")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                XMarkButton()
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        }
    }
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Mohamed Amine Gannoun. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
        }
    }
}
