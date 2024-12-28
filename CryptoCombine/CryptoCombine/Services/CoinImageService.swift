//
//  CoinImageService.swift
//  CryptoCombine
//
//  Created by Amine Gannoun on 28/12/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image : UIImage? = nil
    private var imageSubscription : AnyCancellable?
    
    init(urlString: String){
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString: String){
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink (receiveCompletion: NetworkingManager.handleCompletion,
                   receiveValue: { [weak self] result in
                self?.image = result
                self?.imageSubscription?.cancel()
            })
    }
    
}
