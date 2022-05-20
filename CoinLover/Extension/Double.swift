//
//  Double.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/20.
//

import Foundation

extension Double {
	
	// MARK: - Convert Currency
	/// convert Double into a Currency with 2-6 decimal places
	///```
	///convert 1234.56 to $1,234.56
	///convert 12.3456 to $12.3456
	///convert 0.123456 to $0.12345
	///```
	private var currencyFormatter6: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.usesGroupingSeparator = true
		formatter.numberStyle = .currency
		formatter.locale = .current // defult value
		formatter.currencyCode = "usd" // change currency
		formatter.currencySymbol = "$" // change currency symbol
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 6
		return formatter
	}
	
	/// convert Double into a Currency with 2-6 decimal places convert String
	///```
	///convert 1234.56 to "$1,234.56"
	///convert 12.3456 to "$12.3456"
	///convert 0.123456 to "$0.12345"
	///```
	func asCurrencywith6Decimals() -> String {
		let number = NSNumber(value: self)
		return currencyFormatter6.string(from: number) ?? "$0.00"
	}
	
	/// convert Double into a KOREA Currency with 2-6 decimal places
	///```
	///convert 1234.56 to ₩1,234.56
	///convert 12.3456 to ₩12.34
	///convert 0.123456 to ₩0.12
	///```
	private var currencyKRFormatter2: NumberFormatter {
		let formatter = NumberFormatter()
		formatter.usesGroupingSeparator = true
		formatter.numberStyle = .currency
		formatter.locale = Locale(identifier: "ko_KR") // Korea
		formatter.currencyCode = "krw" // change currency
		formatter.currencySymbol = "₩" // change currency symbol
		formatter.minimumFractionDigits = 0
		return formatter
	}
	
	/// convert Double into a Currency with 2-6 decimal places convert String
	///```
	///convert 1234.56 to ₩1,234.56
	///convert 12.3456 to ₩12.34
	///convert 0.123456 to ₩0.12
	///```
	func asCurrencyKRwith6Decimals() -> String {
		let number = NSNumber(value: self)
		return currencyKRFormatter2.string(from: number) ?? "₩0.00"
	}
	
	
	// MARK: - Convert Percentage
	/// Convert a Double into string representation
	///```
	///convert 1.2345 to "1.23"
	///```
	func asNumberString() -> String {
		return String(format: "%.2f", self)
	}
	
	/// Convert a Double into string representation with percent symbol
	///```
	///convert 1.2345 to "1.23%"
	///```
	func asPercentString() -> String {
		return asNumberString() + "%"
	}
}
