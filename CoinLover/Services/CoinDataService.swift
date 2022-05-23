//
//  CoinDataService.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/20.
//

import Foundation
import Combine

class CoinDataService {
	// MARK: -  PROPERTY
	@Published var fetchedCoins: [CoinModel] = []
	var coinSubscription: AnyCancellable?
	
	// MARK: -  INIT
	init() {
		getCoins()
	}
	// MARK: -  FUNCTION
	private func getCoins() {
		guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=krw&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
		
		coinSubscription = NetworkingManager.download(url: url)
			.decode(type: [CoinModel].self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
				self?.fetchedCoins = returnedCoins
				self?.coinSubscription?.cancel()
			})
	}
}
