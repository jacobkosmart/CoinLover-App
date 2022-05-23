//
//  CoinImageView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/23.
//

import SwiftUI

struct CoinImageView: View {
	// MARK: -  PROPERTY
	@StateObject var vm: CoinImageViewModel
	
	init(coin: CoinModel) {
		_vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
	}
	// MARK: -  BODY
	var body: some View {
		ZStack {
			if let image = vm.image {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
			} else if vm.isLoading {
				ProgressView()
			} else  {
				Image(systemName: "questionmark")
					.foregroundColor(Color.theme.secondaryText)
			}
		} //: ZSTACK
	}
}

// MARK: -  PREVIEW
struct CoinImageView_Previews: PreviewProvider {
	static var previews: some View {
		CoinImageView(coin: dev.coin)
			.padding()
			.previewLayout(.sizeThatFits)
	}
}
