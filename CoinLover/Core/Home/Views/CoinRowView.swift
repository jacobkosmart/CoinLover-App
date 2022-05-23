//
//  CoinRowView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/20.
//

import SwiftUI

struct CoinRowView: View {
	// MARK: -  PROPERTY
	let coin: CoinModel
	let showHoldingsColumn: Bool
	// MARK: -  BODY
	var body: some View {
		HStack (spacing: 0) {
			leftColumn
			Spacer()
			if showHoldingsColumn {
				centerColumn
			}
			rightColumn
		} //: HSTACK
		.font(.subheadline)
	}
}

// MARK: -  PREVIEW
struct CoinRowView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			CoinRowView(coin: dev.coin, showHoldingsColumn: true)
				.previewLayout(.sizeThatFits)
		}
		
		Group {
			CoinRowView(coin: dev.coin, showHoldingsColumn: true)
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
		}

	}
}

// MARK: - EXTENTION
extension CoinRowView {
	
	private var leftColumn: some View {
		HStack(spacing: 0){
			Text("\(coin.rank)")
				.font(.caption)
				.foregroundColor(Color.theme.secondaryText)
				.frame(minWidth: 30)
			CoinImageView(coin: coin)
				.frame(width: 30, height: 30)
			Text(coin.symbol.uppercased())
				.padding(.leading, 6)
				.foregroundColor(Color.theme.accent)
		} //: HSTACK
	}
	
	private var centerColumn: some View {
		VStack(alignment: .trailing) {
			Text(coin.currentHoldingsValue.asCurrencyKRwith6Decimals()).bold()
			Text((coin.currentHoldings ?? 0).asNumberString())
		}
		.foregroundColor(Color.theme.accent)
	}
	
	private var rightColumn: some View {
		VStack(alignment: .trailing){
			Text(coin.currentPrice.asCurrencyKRwith6Decimals()).bold()
			Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
				.foregroundColor(
					(coin.priceChangePercentage24H ?? 0) >= 0
					? Color.theme.green
					: Color.theme.red
				)
		} //: VSTACK
		.frame(width: UIScreen.main.bounds.width / 3.0, alignment: .trailing)
	}
}
