//
//  Color.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/19.
//

import Foundation
import SwiftUI

extension Color {
	static let theme = ColorTheme()
}

struct ColorTheme {
	let accent = Color("AccentColor")
	let background = Color("BackgroundColor")
	let green = Color("GreenColor")
	let red = Color("RedColor")
	let secondaryText = Color("SecondaryColor")
}
