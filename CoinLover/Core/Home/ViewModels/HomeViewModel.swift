//
//  HomeViewModel.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/20.
//

import Foundation

class HomeViewModel: ObservableObject {
	// MARK: -  PROPERTY
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	// MARK: -  INIT
	init() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
			self.allCoins.append(DeveloperPreview.instance.coin)
			self.portfolioCoins.append(DeveloperPreview.instance.coin)
		}
	}
	// MARK: -  FUNCTION
}
