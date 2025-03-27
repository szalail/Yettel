//
//  YettelButton.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 26..
//

import SwiftUI

struct YettelButton: View {
	let design: ButtonDesign
	let text: String
	let onTap: () -> Void
	
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
