//
//  PortfolioView.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 03/01/2025.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var selectedCoin: CoinModel?
    @State private var quantityText : String = ""
    @State private var showCheckMark: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    
                    SearchBarView(searchText: $viewModel.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    trailingNavBarButton
                }

            }
            .onChange(of: viewModel.searchText) { _, newValue in
                if newValue == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.instance.homeViewModel)
}

extension PortfolioView {
    
    private var coinLogoList : some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(spacing: 10) {
                ForEach(viewModel.searchText.isEmpty ? viewModel.portfolioCoins : viewModel.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture(perform: {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        })
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke( selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
                
            }
            .padding()
        }
    }
    
    private func updateSelectedCoin(coin: CoinModel){
        selectedCoin = coin
        
        if let portfolioCoin = viewModel.portfolioCoins.first(where: {$0.id == coin.id}),
           let amount = portfolioCoin.currentHolding {
            quantityText = "\(amount)"
        }else{
            quantityText = ""
        }
        
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0.0
    }
    
    private var portfolioInputSection : some View {
        withAnimation(.none) {
            VStack(spacing: 20) {
                HStack{
                    Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                    Spacer()
                    Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
                }
                Divider()
                HStack{
                    Text("Amount holding:")
                    Spacer()
                    TextField("Ex. 1.4", text: $quantityText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
                Divider()
                HStack{
                    Text("Current value:")
                    Spacer()
                    Text(getCurrentValue().asCurrencyWith2Decimals())
                }
            }
            .padding()
            .font(.headline)
        }
    }
    
    private var trailingNavBarButton : some View {
        HStack(spacing: 8){
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1 : 0)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("SAVE")
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHolding != Double(quantityText)) ? 1 : 0
            )
        }
        .font(.headline)
    }
    
    private func saveButtonPressed(){
        guard let coin = selectedCoin, let amount = Double(quantityText) else{
            return
        }
        
        // Save to portfolio
        viewModel.updatePortfolio(coin: coin, amount: amount)
        
        // show checkmark
        withAnimation(.easeIn){
            showCheckMark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation(.easeOut){
                showCheckMark = false
            }
        }
        
    }
    
    private func removeSelectedCoin(){
        selectedCoin = nil
        viewModel.searchText = ""
    }
    
}
