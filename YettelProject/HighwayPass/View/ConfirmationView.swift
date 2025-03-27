//
//  SwiftUIView.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 26..
//

import SwiftUI

struct Constants {
	static let buttonTitle: String = "Rendben"
	static let message: String = "A matricákat sikeresen kifizetted!"
	static let buttonWidth: CGFloat = 311
	static let textFrameWidth: CGFloat = 301
	static let textFrameHeight: CGFloat = 192
	static let guyImageFrameWidth: CGFloat = 281
	static let guyImageFrameHeight: CGFloat = 293
	static let messageFontSize: CGFloat = 40
}

struct ConfirmationView: View {
    var body: some View {
		ZStack {
			Color.yettelGreen
				.ignoresSafeArea()
			
			VStack {
				Spacer()
				HStack {
					Text(Constants.message)
						.foregroundColor(.yettelBlue)
						.font(.system(size: Constants.messageFontSize, weight: .bold))
						.lineSpacing(Padding.half)
						.frame(
							width: Constants.textFrameWidth,
							height: Constants.textFrameHeight
						)

					Spacer()
				}
				
				HStack {
					Spacer()

					Image("Guy")
						.resizable()
						.scaledToFit()
						.frame(
							width: Constants.guyImageFrameWidth,
							height: Constants.guyImageFrameHeight,
							alignment: .trailing
						)
				}
				
				YettelButton(design: .filled, text: Constants.buttonTitle, onTap: {})
					.padding(.vertical, Padding.singleAndHalf)
					.frame(width: Constants.buttonWidth)
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
	ConfirmationView()
}
