//
//  HomeView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import SwiftUI

struct HomeView: View {
	// MARK: -  PROPERTY
	@State private var showPortfolio: Bool = false
	// MARK: -  BODY
	var body: some View {
		ZStack {
			// Background Layer
			Color.theme.background.ignoresSafeArea()
			
			// Content Layer
			VStack {
					homeHeader
				Spacer(minLength: 0)
			} //: VSTACK
		} //: ZSTACK
	}
}

// MARK: -  PREVIEW[
struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			HomeView()
				.navigationBarHidden(true)
		}
	}
}


// MARK: - EXTENTION
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
			Text(showPortfolio ? "Portfolio" : "Live Prices")
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
}
