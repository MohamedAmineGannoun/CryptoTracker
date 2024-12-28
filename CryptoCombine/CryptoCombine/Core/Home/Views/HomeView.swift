//
//  HomeView.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 24/12/2024.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel : HomeViewModel
    @State private var showPortfolio : Bool = false
    
    var body: some View {
        ZStack{
            //background
            Color.theme.background
                .ignoresSafeArea()
            //content
            VStack{
                homeHeader
                
                HomeStatisticsView(showPortfolio: $showPortfolio)
                
                SearchBarView(searchText: $viewModel.searchText)
                    .padding()
                
                columnsTitles
                
                if showPortfolio {
                    portfolioCoinsList
                }else{
                    allCoinsList
                }
                
            }
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
            .toolbar(.hidden)
            .environmentObject(DeveloperPreview.instance.homeViewModel)
    }
}

extension HomeView {
    private var homeHeader : some View {
        HStack{
            
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(nil, value: UUID())
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(nil, value: UUID())
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList : some View {
        List{
            ForEach(viewModel.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .leading))
    }
    
    private var portfolioCoinsList : some View {
        List{
            ForEach(viewModel.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .transition(.move(edge: .trailing))
    }
    
    private var columnsTitles : some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Spacer()
            Text("Price")
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
}
