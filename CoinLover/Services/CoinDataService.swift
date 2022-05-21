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
		
		coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
			.subscribe(on: DispatchQueue.global(qos: .default))
			.tryMap { (output) -> Data in
				guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300  else {
					throw URLError(.badServerResponse)
				}
				return output.data
			}
			.receive(on: DispatchQueue.main)
			.decode(type: [CoinModel].self, decoder: JSONDecoder())
			.sink { (completion) in
				switch completion {
				case .finished:
					break
				case .failure(let error):
					print(error.localizedDescription)
				}
			} receiveValue: { [weak self] (returnedCoins) in
				self?.fetchedCoins = returnedCoins
				self?.coinSubscription?.cancel()
			}
	}
}
