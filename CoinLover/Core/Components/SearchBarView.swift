//
//  SearchBarView.swift
//  CoinLover
//
//  Created by Jacob Ko on 2022/05/23.
//

import SwiftUI

struct SearchBarView: View {
	// MARK: -  PROPERTY
	@Binding var searchText: String
	// MARK: -  BODY
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(Color.theme.secondaryText)
			
			TextField("코인명 및 약어를 입력하세요", text: $searchText)
				.foregroundColor(
					searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
				)
				.disableAutocorrection(true)
				.overlay(
					Image(systemName: "xmark.circle.fill")
						.padding()
						.offset(x: 10)
						.foregroundColor(Color.theme.accent)
						.opacity(searchText.isEmpty ? 0.0 : 1.0)
						.onTapGesture {
							UIApplication.shared.endEditing()
							searchText = ""
						}
					, alignment: .trailing
				)
		} //: HSTACK
		.font(.headline)
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 25)
				.fill(Color.theme.background)
				.shadow(
					color: Color.theme.accent.opacity(0.15),
					radius: 10, x: 0, y: 0)
		)
		.padding()
	}
}

// MARK: -  PREVIEW
struct SearchBarView_Previews: PreviewProvider {
	static var previews: some View {
		Group{
			SearchBarView(searchText: .constant(""))
				.previewLayout(.sizeThatFits)
		}
		
		Group{
			SearchBarView(searchText: .constant(""))
		}
		.preferredColorScheme(.dark)
		.previewLayout(.sizeThatFits)

	}
}
