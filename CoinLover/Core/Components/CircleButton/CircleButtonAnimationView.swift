//
//  CircleButtonAnimationView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import SwiftUI

struct CircleButtonAnimationView: View {
	// MARK: -  PROPERTY
	@Binding var animate: Bool
	// @State private var animate: Bool = false
	// MARK: -  BODY
	var body: some View {
		Circle()
			.stroke(lineWidth: 5.0)
			.scale(animate ? 1.2 : 0.0)
			.opacity(animate ? 0.0 : 1.0)
			.animation(animate ? Animation.easeOut(duration: 1.0) : .none, value: animate)
	}
}

// MARK: -  PREVIEW
struct CircleButtonAnimationView_Previews: PreviewProvider {
	static var previews: some View {
		CircleButtonAnimationView(animate: .constant(false))
			.foregroundColor(.red)
			.frame(width: 100, height: 100)
	}
}


