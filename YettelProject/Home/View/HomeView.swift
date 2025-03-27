//
//  SwiftUIView.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 27..
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		ZStack {
			Color.yettelGreen
				.ignoresSafeArea()
			YettelButton(design: .filled, text: "Autópálya matricák", onTap: {})
				.padding(.horizontal, Padding.triple)
		}
    }
}

#Preview {
	HomeView()
}
