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
	@StateObject private var viewModel = HighwayPassViewModel()
	@State private var selectedVignette: VignetteType? = nil
	
	var body: some View {
		List {
			Section {
				HStack {
					if let type = viewModel.vehicleInfo?.type {
						Image(type == "CAR" ? "Car" : "")
							.resizable()
							.scaledToFit()
							.frame(
								width: StartingPageConstants.carIconSize,
								height: StartingPageConstants.carIconSize
							)
					}
					
					VStack(alignment: .leading) {
						Text(viewModel.vehicleInfo?.plate ?? "Error")
							.font(.system(size: Padding.double))
							.foregroundColor(.yettelBlue)
							.padding(.bottom, Padding.half)
						Text(viewModel.vehicleInfo?.name ?? "Error")
							.font(.system(size: Padding.singleAndHalf))
							.foregroundColor(.yettelBlue)
					}
					.padding(.leading, Padding.half)
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
						ForEach(viewModel.wholeVignetteTypes, id: \.id) { vignette in
							let isSelected = selectedVignette?.id == vignette.id
							VignetteRow(
								vignette: vignette,
								isSelected: isSelected
							) {
								selectedVignette = vignette
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
		.task {
			viewModel.fetchVehicleInfo()
			viewModel.fetchVignetteTypes()
		}
	}
}

// MARK: - Subview: VignetteRow
private struct VignetteRow: View {
	let vignette: VignetteType
	let isSelected: Bool
	let onSelect: () -> Void
	
	let vignetteTexts: [String: String] = [
		"DAY": "D1 - napi (1 napos)",
		"WEEK": "D1 - heti (10 napos)",
		"MONTH": "D1 - havi"
	]

	var body: some View {
		HStack {
			Image(systemName: isSelected ? "circle.fill" : "circle")
				.foregroundColor(.yettelBlue)
			Text(vignetteTexts[vignette.name] ?? "")
				.foregroundColor(.yettelBlue)
			Spacer()
			Text("\(vignette.sum, specifier: "%.0f") Ft")
				.foregroundColor(.yettelBlue)
				.bold()
		}
		.padding(Padding.double)
		.frame(height: StartingPageConstants.optionFrameHeight)
		.contentShape(Rectangle())
		.overlay {
			RoundedRectangle(cornerRadius: StartingPageConstants.cornerRadius)
				.stroke(isSelected ? Color.yettelBlue : Color.secondary, lineWidth: Padding.quarter)
		}
		.onTapGesture {
			onSelect()
		}
	}
}

#Preview {
	HighwayPassStartingPage()
}
