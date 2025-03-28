//
//  SwiftUIView.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 27..
//

import SwiftUI

struct StartingPageConstants {
	static let carIconSize: CGFloat = 24
	static let cornerRadius: CGFloat = 8
	static let optionFrameHeight: CGFloat = 76
	static let purchaseButtonText: String = "Vásárlás"
	static let countryTileTitle: String = "Országos matricák"
	static let countyLinkText: String = "Éves vármegyei matricák"
}

struct HighwayPassStartingPage: View {
	@State private var selectedOption: String? = nil
	
	let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
	
    var body: some View {
		List {
			Section {
				HStack {
					Image("Guy")
						.resizable()
						.scaledToFit()
						.frame(
							width: StartingPageConstants.carIconSize,
							height: StartingPageConstants.carIconSize
						)
					VStack(alignment: .leading) {
						Text("License Plate")
							.font(.system(size: Padding.double))
							.foregroundColor(.yettelBlue)
						Text("Name")
							.font(.system(size: Padding.singleAndHalf))
							.foregroundColor(.yettelBlue)
					}
				}
				.padding(.vertical, Padding.single)
			}
			
			Section {
				VStack {
					HStack {
						Text(StartingPageConstants.countryTileTitle)
							.font(.system(size: Padding.doubleAndHalf, weight: .bold))
							.foregroundColor(.yettelBlue)
							.padding(.top, Padding.single)
						Spacer()
					}

					VStack(spacing: Padding.double) {
						ForEach(options, id: \.self) { option in
							HStack {
								if selectedOption == option {
									Image(systemName: "circle.fill")
										.foregroundColor(.yettelBlue)
								} else {
									Image(systemName: "circle")
										.foregroundColor(.yettelBlue)
								}
								Text(option)
									.foregroundColor(.yettelBlue)
								Spacer()
								Text("Price Ft")
									.foregroundColor(.yettelBlue)
									.bold()
							}
							.padding(Padding.double)
							.frame(height: StartingPageConstants.optionFrameHeight)
							.contentShape(Rectangle())
							.overlay {
								if selectedOption == option {
									RoundedRectangle(cornerRadius: StartingPageConstants.cornerRadius)
										.stroke(Color.yettelBlue, lineWidth: Padding.quarter)
								} else {
									RoundedRectangle(cornerRadius: StartingPageConstants.cornerRadius)
										.stroke(Color.secondary, lineWidth: Padding.quarter)
								}
							}
							.onTapGesture {
								selectedOption = option
							}
						}
					}
					
					
					YettelButton(
						design: .filled,
						text: StartingPageConstants.purchaseButtonText,
						onTap: {}
					)
					.buttonStyle(PlainButtonStyle())
					.padding(.vertical, Padding.singleAndHalf)
				}
			}
			
			Section {
				NavigationLink(value: "CountySelection") {
					Text(StartingPageConstants.countyLinkText)
						.font(.system(size: Padding.doubleAndHalf, weight: .bold))
						.foregroundColor(.yettelBlue)
						.padding(.vertical, Padding.singleAndHalf)
				}
			}
		}
		.navigationTitle(FeatureNavigationTitle.HighwayPass)
		.toolbarBackground(Color.yettelGreen, for: .navigationBar)
		.toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
	HighwayPassStartingPage()
}
