//
//  CoinImageService.swift
//  BaseCrypto
//
//  Created by Dũng Nguyễn on 9/11/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubcription: AnyCancellable?
    private var coin: CoinModel
    
    
    init(coin: CoinModel){
        self.coin = coin
        getCoinImage()
    }
    
    
    private func getCoinImage(){
        
        guard let url = URL(string: coin.image) else { return }
        
        imageSubcription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data:data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnImage) in
                self?.image = returnImage
                self?.imageSubcription?.cancel()
            })
        
    }
}
