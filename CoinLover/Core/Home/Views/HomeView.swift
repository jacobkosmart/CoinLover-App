//
//  HomeView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import SwiftUI

struct HomeView: View {
	// MARK: -  PROPERTY
	@EnvironmentObject private var vm: HomeViewModel
	@State private var showPortfolio: Bool = false
	// MARK: -  BODY
	var body: some View {
		ZStack {
			// Background Layer
			Color.theme.background.ignoresSafeArea()
			
			// Content Layer
			VStack {
				homeHeader
				
				SearchBarView(searchText: $vm.searchText)
				
				ColumnTitiles
				
				if !showPortfolio {
					allCoinList
						.transition(.move(edge: .leading))
				}
				if showPortfolio {
					PortfolioCoinsList
						.transition(.move(edge: .trailing))
				}
				
				Spacer(minLength: 0)
			} //: VSTACK
		} //: ZSTACK
	}
}

// MARK: -  PREVIEW
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			HomeView()
				.navigationBarHidden(true)
		}
		.environmentObject(dev.homeVM)
	}
}


// MARK: - EXTENSION
extension HomeView {
	
	// Header
	private var homeHeader: some View {
		HStack {
			CircleButtonView(iconName: showPortfolio ? "plus" : "info")
				.animation(.none, value: showPortfolio)
				.background(
					CircleButtonAnimationView(animate: $showPortfolio)
				)
			Spacer()
			Text(showPortfolio ? "내 자산" : "실시간 가격")
				.font(.headline)
				.fontWeight(.heavy)
				.foregroundColor(Color.theme.accent)
				.transaction { transaction in
					transaction.animation = nil
				}
			Spacer()
			CircleButtonView(iconName: "chevron.right")
				.rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
				.onTapGesture {
					withAnimation(.spring()) {
						showPortfolio.toggle()
					}
				}
		}
		.padding(.horizontal)
	}
	
	// Column Titles
	private var ColumnTitiles: some View {
		HStack {
			Text("코인")
			Spacer()
			if showPortfolio {
				Text("현재 보유량")
			}
			Text("가격")
				.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
		} //: HSTACK
		.font(.caption)
		.foregroundColor(Color.theme.secondaryText)
		.padding(.horizontal)
	}
	
	// All Coin List
	private var allCoinList: some View {
		List {
			ForEach(vm.allCoins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: false)
					.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
			}
		}
		.listStyle(.plain)
	}
	
	// Portfolio Coins List
	private var PortfolioCoinsList: some View {
		List {
			ForEach(vm.portfolioCoins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: true)
					.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
			}
		}
		.listStyle(.plain)
	}
}
