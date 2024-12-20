//
//  CoinDataService.swift
//  BaseCrypto
//
//  Created by Dũng Nguyễn on 8/11/24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var cancellables = Set<AnyCancellable>()
    
    var coinSubcription: AnyCancellable?
    
    init(){
        getCoin()
    }
    
    private func getCoin(){
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubcription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoin) in
                self?.allCoins = returnedCoin
                self?.coinSubcription?.cancel()
            })
        
    }
    
    
}
