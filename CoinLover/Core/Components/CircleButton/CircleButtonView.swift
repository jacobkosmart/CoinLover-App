//
//  CircleButtonView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import SwiftUI

struct CircleButtonView: View {
	// MARK: -  PROPERTY
	let iconName: String
	
	// MARK: -  BODY
	var body: some View {
		Image(systemName: iconName)
			.font(.headline)
			.foregroundColor(Color.theme.accent)
			.frame(width: 50, height: 50)
			.background(
				Circle()
					.foregroundColor(Color.theme.background)
			)
			.shadow(
				color: Color.theme.accent.opacity(0.25),
				radius: 10, x: 0, y: 0)
	}
}

// MARK: -  PREVIEW
struct CircleButtonView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			CircleButtonView(iconName: "info")
				.padding()
				.previewLayout(.sizeThatFits)
		}
		
		Group {
			CircleButtonView(iconName: "plus")
				.padding()
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
		}
	}
}
