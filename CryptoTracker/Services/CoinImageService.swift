//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Michael on 5/23/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscriptoin: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            downloadCoinImage()
            print("Downloading image now")
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscriptoin = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscriptoin?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName , folderName: self.folderName)

            })
    }
    
}
