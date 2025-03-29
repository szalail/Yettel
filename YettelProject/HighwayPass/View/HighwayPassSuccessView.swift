//
//  SwiftUIView.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 26..
//

import SwiftUI

struct SuccessPageConstants {
	static let buttonTitle: String = "Rendben"
	static let message: String = "A matricákat sikeresen kifizetted!"
	static let buttonWidth: CGFloat = 311
	static let textFrameWidth: CGFloat = 301
	static let textFrameHeight: CGFloat = 192
	static let guyImageFrameWidth: CGFloat = 281
	static let guyImageFrameHeight: CGFloat = 293
	static let messageFontSize: CGFloat = 40
}

struct HighwayPassSuccessView: View {
    var body: some View {
		ZStack {
			Color.yettelGreen
				.ignoresSafeArea()
			
			VStack {
				Spacer()
				HStack {
					Text(SuccessPageConstants.message)
						.foregroundColor(.yettelBlue)
						.font(.system(size: SuccessPageConstants.messageFontSize, weight: .bold))
						.lineSpacing(Padding.half)
						.frame(
							width: SuccessPageConstants.textFrameWidth,
							height: SuccessPageConstants.textFrameHeight
						)

					Spacer()
				}
				
				HStack {
					Spacer()

					Image("Guy")
						.resizable()
						.scaledToFit()
						.frame(
							width: SuccessPageConstants.guyImageFrameWidth,
							height: SuccessPageConstants.guyImageFrameHeight,
							alignment: .trailing
						)
				}
				
				YettelButton(design: .filled, text: SuccessPageConstants.buttonTitle, onTap: {})
					.padding(.vertical, Padding.singleAndHalf)
					.frame(width: SuccessPageConstants.buttonWidth)
			}
			VStack {
				Image("Confetti")
					.resizable()
					.scaledToFit()
					.ignoresSafeArea()
				Spacer()
			}
		}
    }
}

#Preview {
	HighwayPassSuccessView()
}
