//
//  HighwayPassCountySelectionView.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 28..
//

import SwiftUI

struct CountySelectioneConstants {
	static let countySelectionTitle: String = "Éves vármegyei matricák"
	static let totalPriceTitle: String = "Fizetendő összeg"
	static let buttonText: String = "Tovább"
	static let navigationTitle: String = "Tovább"
	static let totalPriceSize: CGFloat = 40
}

struct ChoiceItem: Identifiable {
	let id = UUID()
	var isSelected: Bool
	var firstText: String
	var secondText: String
}

struct HighwayPassCountySelectionView: View {
	@State private var items: [ChoiceItem] = [
			ChoiceItem(isSelected: false, firstText: "Option 1", secondText: "Details 1"),
			ChoiceItem(isSelected: false, firstText: "Option 2", secondText: "Details 2"),
			ChoiceItem(isSelected: false, firstText: "Option 3", secondText: "Details 3")
		]
	
	var body: some View {
		ScrollView {
			VStack {
				HStack {
					Text(CountySelectioneConstants.countySelectionTitle)
						.font(.system(size: Padding.doubleAndHalf, weight: .bold))
						.foregroundColor(.yettelBlue)
						.padding(.top, Padding.single)
					Spacer()
				}
				
				// This is currently static, with more time this could be dynamic
				Image("Map")
					.resizable()
					.scaledToFit()
					.padding(.vertical, Padding.triple)
				
				ForEach($items) { $item in
					HStack {
						Button(action: {
							item.isSelected.toggle()
						}) {
							Image(systemName: item.isSelected ? "checkmark.square" : "square")
								.foregroundColor(item.isSelected ? .yettelBlue : .gray)
								.font(.system(size: 24))
						}
						.buttonStyle(PlainButtonStyle())
						
						// Editable Text Fields
						Text(item.firstText)
							.foregroundColor(.yettelBlue)
						
						Spacer()
						
						Text(item.secondText)
							.foregroundColor(.yettelBlue)
							.bold()
					}
					.padding(.vertical, 5)
				}
				
				Divider()
					.padding(.top, Padding.singleAndHalf)
				
				HStack {
					Text(CountySelectioneConstants.totalPriceTitle)
						.font(.system(size: Padding.singleAndHalf, weight: .bold))
						.foregroundColor(.yettelBlue)
						.padding(.top, Padding.triple)
					Spacer()
				}
				
				HStack {
					Text("200000 Ft")
						.font(.system(size: CountySelectioneConstants.totalPriceSize, weight: .bold))
						.foregroundColor(.yettelBlue)
						.padding(.top, Padding.quarter)
					Spacer()
				}
				
				YettelButton(
					design: .filled,
					text: CountySelectioneConstants.buttonText,
					onTap: {}
				)
			}
		}
		.padding(.horizontal, Padding.triple)
		.padding(.top, Padding.triple)
		.navigationTitle(FeatureNavigationTitle.HighwayPass)
		.toolbarBackground(Color.yettelGreen, for: .navigationBar)
		.toolbarBackground(.visible, for: .navigationBar)
	}
}

#Preview {
    HighwayPassCountySelectionView()
}
