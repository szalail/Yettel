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
		.background(.black)
		.foregroundColor(.white)
		.cornerRadius(25)
    }
}

enum ButtonDesign {
	case filled
	case empty
}

#Preview {
	YettelButton(design: .filled, text: "Mybutton", onTap: {})
}
