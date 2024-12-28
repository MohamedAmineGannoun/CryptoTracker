//
//  CoinImageView.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 27/12/2024.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var viewModel : CoinImageViewModel
    
    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let img = viewModel.image {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFit()
            }else if viewModel.isLoading {
                ProgressView()
            }else{
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.instance.coin)
}
