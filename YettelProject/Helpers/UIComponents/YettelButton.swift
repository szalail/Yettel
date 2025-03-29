//
//  YettelButton.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 26..
//

import SwiftUI

struct ButtonConstants {
	static let cornerRadius: CGFloat = 25
}

struct YettelButton: View {
	let design: ButtonDesign
	let text: String
	let onTap: () -> Void
	/*
	 var body: some View {
	 Button(text) {
	 onTap()
	 }
	 .font(.headline)
	 .padding()
	 .frame(maxWidth: .infinity)
	 .background(design == .filled ? .yettelBlue : .white)
	 .foregroundColor(design == .filled ? .white : .yettelBlue)
	 .cornerRadius(25)
	 .overlay(
	 RoundedRectangle(cornerRadius: 25)
	 .stroke(.yettelBlue, lineWidth: 2)
	 )
	 .contentShape(Rectangle())
	 }
	 */
	var body: some View {
		Button(action: {
			onTap()
		}) {
			Text(text)
				.font(.headline)
				.frame(maxWidth: .infinity) // Ensures the text takes the full width
				.padding()
				.background(design == .filled ? Color.yettelBlue : Color.white)
				.foregroundColor(design == .filled ? .white : .yettelBlue)
				.cornerRadius(ButtonConstants.cornerRadius)
				.overlay(
					RoundedRectangle(cornerRadius: ButtonConstants.cornerRadius)
						.stroke(Color.yettelBlue, lineWidth: Padding.quarter)
				)
		}
		.buttonStyle(PlainButtonStyle())
		.contentShape(Rectangle())
	}
}

enum ButtonDesign {
	case filled
	case empty
}

#Preview {
	YettelButton(design: .empty, text: "Mybutton", onTap: {})
	YettelButton(design: .filled, text: "Mybutton", onTap: {})
}
