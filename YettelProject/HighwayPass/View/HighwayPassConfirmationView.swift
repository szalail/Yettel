//
//  HighwayPassConfirmationView.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 29..
//

import SwiftUI

struct ConfirmationConstants {
	static let title: String = "Vásárlás megerősítése"
	static let licensePlate: String = "Rendszám"
	static let stickerType: String = "Matrica típusa"
	static let usageFee: String = "Rendszerhasználati díj"
	static let buyButtonText: String = "Vásárlás"
	static let cancelButtonText: String = "Mégsem"
	static let usageFeeSize: CGFloat = 14
}

struct Product: Identifiable {
	let id = UUID()
	let name: String
	let price: Int
}

struct HighwayPassConfirmationView: View {
	@EnvironmentObject var pathManager: NavigationPathManager

	let products: [Product] = [
			Product(name: "Apple", price: 5000),
			Product(name: "Banana", price: 5000),
			Product(name: "Orange", price: 5000)
		]
	
    var body: some View {
		ScrollView {
			VStack {
				HStack {
					Text(ConfirmationConstants.title)
						.font(.system(size: Padding.doubleAndHalf, weight: .bold))
						.foregroundColor(.yettelBlue)
						.padding(.top, Padding.single)
					Spacer()
				}
				
				Divider()
				
				VStack(spacing: Padding.doubleAndHalf) {
					HStack {
						Text(ConfirmationConstants.licensePlate)
							.foregroundColor(.yettelBlue)
						Spacer()
						Text("asdasd")
							.foregroundColor(.yettelBlue)
					}
					
					HStack {
						Text(ConfirmationConstants.stickerType)
							.foregroundColor(.yettelBlue)
						Spacer()
						Text("asdasd")
							.foregroundColor(.yettelBlue)
					}
				}
				.padding(.top, Padding.singleAndHalf)
				.padding(.bottom, Padding.single)
				
				Divider()
				
				VStack(spacing: Padding.double) {
					ForEach(products) { product in
						HStack {
							Text(product.name)
								.font(.system(size: Padding.double, weight: .bold))
								.foregroundColor(.yettelBlue)
							
							Spacer()
							
							Text("\(product.price) Ft")
								.font(.system(size: Padding.double, weight: .bold))
								.foregroundColor(.yettelBlue)
						}
					}
					
					HStack {
						Text(ConfirmationConstants.usageFee)
							.font(.system(size: ConfirmationConstants.usageFeeSize))
							.foregroundColor(.yettelBlue)
						
						Spacer()
						
						Text("110 Ft")
							.font(.system(size: ConfirmationConstants.usageFeeSize))
							.foregroundColor(.yettelBlue)
					}
				}
				.padding(.top, Padding.triple)
				.padding(.bottom, Padding.doubleAndHalf)
				
				Divider()
				
				HStack {
					Text(CountySelectioneConstants.totalPriceTitle)
						.font(.system(size: Padding.singleAndHalf, weight: .bold))
						.foregroundColor(.yettelBlue)
					Spacer()
				}
				.padding(.top, Padding.triple)
				
				HStack {
					Text("200000 Ft")
						.font(.system(size: CountySelectioneConstants.totalPriceSize, weight: .bold))
						.foregroundColor(.yettelBlue)
					Spacer()
				}
				.padding(.top, Padding.quarter)

				
				VStack(spacing: Padding.doubleAndHalf) {
					YettelButton(
						design: .filled,
						text: ConfirmationConstants.buyButtonText,
						onTap: {
							pathManager.path.append("Success")
						}
					)
					
					YettelButton(
						design: .empty,
						text: ConfirmationConstants.cancelButtonText,
						onTap: {
							pathManager.path.removeLast()
						}
					)
				}
				.padding(.top, Padding.double)
			}
		}
		.padding(.horizontal, Padding.triple)
		.padding(.top, Padding.triple)
		.toolbarBackground(Color.yettelGreen, for: .navigationBar)
		.toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    HighwayPassConfirmationView()
}
