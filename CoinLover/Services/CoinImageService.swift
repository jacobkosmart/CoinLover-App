//
//  CoinImageService.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
	// MARK: -  PROPERTY
	@Published var image: UIImage? = nil
	var imageSubscription: AnyCancellable?
	private let coin: CoinModel
	// MARK: -  INIT
	init(coin: CoinModel) {
		self.coin = coin
		getCoinImage()
	}
	
	// MARK: -  FUNCTION
	private func getCoinImage() {
		guard let url = URL(string: coin.image) else { return }
		
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				return UIImage(data: data)
			})
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
				self?.image = returnedImage
				self?.imageSubscription?.cancel()
			})
	}
}
