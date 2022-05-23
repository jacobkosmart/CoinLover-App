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
	
	private var imageSubscription: AnyCancellable?
	private let coin: CoinModel
	private let fileManager = LocalFileManager.instance
	private let folerName = "coin_images"
	private let imageName: String
	// MARK: -  INIT
	init(coin: CoinModel) {
		self.coin = coin
		self.imageName = coin.id
		getCoinImage()
	}
	
	// MARK: -  FUNCTION
	
	private func getCoinImage() {
		if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folerName) {
			image = savedImage
			print("Retrieved image from File Manager!")
		} else {
			downloadCoinImage()
			print("Downloading Image now")
		}
	}
	
	private func downloadCoinImage() {
		
		guard let url = URL(string: coin.image) else { return }
		
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				return UIImage(data: data)
			})
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
				guard let self = self, let downloadedImage = returnedImage else { return }
				self.image = downloadedImage
				self.imageSubscription?.cancel()
				self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folerName)
			})
	}
}
