//
//  UIApplication.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/23.
//

import Foundation
import SwiftUI

// close keypad
extension UIApplication {
	
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
