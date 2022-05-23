//
//  CoinImageViewModel.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
	// MARK: -  PROPERTY
	@Published var image: UIImage? = nil
	@Published var isLoading: Bool = false
	
	private let coin: CoinModel
	private let dataService: CoinImageService
	private var cancellable = Set<AnyCancellable>()
	
	// MARK: -  INIT
	init(coin: CoinModel) {
		self.coin = coin
		self.dataService = CoinImageService(coin: coin)
		addSubscribers()
		self.isLoading = true
	}
	// MARK: -  FUNCTION
	 private func addSubscribers() {
		 dataService.$image
			 .sink { [weak self] (_) in
				 self?.isLoading = false
			 } receiveValue: { [weak self] (returnedImage) in
				 self?.image = returnedImage
			 }
			 .store(in: &cancellable)
	}
}
