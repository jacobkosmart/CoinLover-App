//
//  HomeViewModel.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/20.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
	// MARK: -  PROPERTY
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	
	@Published var searchText: String = ""
	
	private let dataService = CoinDataService()
	private var cancellables = Set<AnyCancellable>()
	// MARK: -  INIT
	init() {
		addSubscribers()
	}
	// MARK: -  FUNCTION
	func addSubscribers() {
		
		// update allCoins
		$searchText
			.combineLatest(dataService.$fetchedCoins)
		// debonce will wait 0.5 sec before running the rest of this code
		// some of user types letter quickly, so debounce make the search term
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.map(filterCoins)
			.sink { [weak self] (returnedCoins) in
				self?.allCoins = returnedCoins
			}
			.store(in: &cancellables)
	}
	
	private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
		guard !text.isEmpty else {
			return coins
		}
		let lowercasedText = text.lowercased()
		
		let filteredCoins = coins.filter { (coin) -> Bool in
			return coin.name.lowercased().contains(lowercasedText) || coin.symbol.lowercased().contains(lowercasedText) || coin.id.lowercased().contains(lowercasedText)
			
		}
		return filteredCoins
	}
}
