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
	
	private let dataService = CoinDataService()
	private var cancellables = Set<AnyCancellable>()
	// MARK: -  INIT
	init() {
		addSubscribers()
	}
	// MARK: -  FUNCTION
	func addSubscribers() {
		dataService.$fetchedCoins
			.sink { [weak self] (returnedCoins) in
				self?.allCoins = returnedCoins
			}
			.store(in: &cancellables)
	}
}
