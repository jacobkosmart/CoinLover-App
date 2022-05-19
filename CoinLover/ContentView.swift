//
//  ContentView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		ZStack {
			Color.theme.background.ignoresSafeArea()
			
			VStack (spacing: 20) {
				Text("Accent Color")
					.foregroundColor(Color.theme.accent)
				
				Text("Seconday Text Color")
					.foregroundColor(Color.theme.secondaryText)
				
				Text("Red Color")
					.foregroundColor(Color.theme.red)
				
				Text("Green Color")
					.foregroundColor(Color.theme.green)
			}
			.font(.headline)
			
		} //: ZSTACK
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.dark)
	}
}
