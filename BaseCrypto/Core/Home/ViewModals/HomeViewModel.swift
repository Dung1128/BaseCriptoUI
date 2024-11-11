//
//  HomeViewModel.swift
//  BaseCrypto
//
//  Created by Dũng Nguyễn on 8/11/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    
    private let dataService = CoinDataService()
    private var cancellables  = Set<AnyCancellable>()
    
    
    init(){
        addSubcriber()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
    }
    
    func addSubcriber(){
        dataService.$allCoins
            .sink { [weak self] retuernedCoins in
                self?.allCoins = retuernedCoins
            }
            .store(in: &cancellables)
    }
    
}
