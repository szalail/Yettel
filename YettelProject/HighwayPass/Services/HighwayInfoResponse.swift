//
//  HighwayInfoResponse.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 30..
//

struct HighwayInfoResponse: Codable {
	let payload: Payload

	struct Payload: Codable {
		let highwayVignettes: [HighwayVignette]

		struct HighwayVignette: Codable {
			let vignetteType: [String]
			let sum: Double
		}
	}
}
