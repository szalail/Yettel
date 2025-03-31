//
//  VignetteType.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 30..
//

import Foundation

struct VignetteType: Codable, Identifiable {
	var id: String { name }
	let name: String
	let sum: Double
}
