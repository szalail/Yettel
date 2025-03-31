//
//  OrderRequest.swift
//  YettelProject
//
//  Created by Macbook on 2025. 04. 01..
//

import Foundation

import Foundation

struct HighwayOrderRequest: Codable {
	struct HighwayOrder: Codable {
		let type: String
		let category: String
		let cost: Double
	}
	
	let highwayOrders: [HighwayOrder]
}
