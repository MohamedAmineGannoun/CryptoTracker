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
    private let coin : CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName : String
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("retrieved image from file manager")
        }else{
            print("download coin image")
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage(){
        
        guard let url = URL(string: coin.image) else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink (receiveCompletion: NetworkingManager.handleCompletion,
                   receiveValue: { [weak self] (returnImage) in
                guard let self = self, let img = returnImage else{
                    return
                }
                self.image = img
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: img, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
}
