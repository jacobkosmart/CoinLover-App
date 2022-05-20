//
//  CoinLoverApp.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import SwiftUI

@main
struct CoinLoverApp: App {
	
	@StateObject private var vm = HomeViewModel()
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
			} //: NAVIGATION
			.environmentObject(vm)
		}
	}
}
