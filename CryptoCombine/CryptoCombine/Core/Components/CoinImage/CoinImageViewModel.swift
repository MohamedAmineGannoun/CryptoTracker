//
//  CoinImageViewModel.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 28/12/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel : ObservableObject {
    
    @Published var image : UIImage? = nil
    @Published var isLoading : Bool = false
    private let dataService : CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.dataService = CoinImageService(urlString: coin.image)
        addSubscribers()
    }
    
    private func addSubscribers(){
        dataService.$image.sink { [weak self] _ in
            self?.isLoading = false
        } receiveValue: {[weak self] image in
            self?.image = image
        }
        .store(in: &cancellables)

    }
    
}
