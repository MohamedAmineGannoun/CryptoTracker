//
//  HomeStatisticsView.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 28/12/2024.
//

import SwiftUI

struct HomeStatisticsView: View {
    
    @EnvironmentObject private var viewModel : HomeViewModel
    
    @Binding var showPortfolio : Bool
    
    var body: some View {
        HStack{
            ForEach(viewModel.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatisticsView(showPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeViewModel)
}
