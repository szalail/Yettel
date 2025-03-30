//
//  HighwayPassViewModel.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 30..
//

import SwiftUI

class HighwayPassViewModel: ObservableObject {
	@Published var vehicleInfo: VehicleInfo?

	func fetchVehicleInfo() {
		NetworkService.shared.fetchVehicleInfo { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let vehicleInfo):
					self.vehicleInfo = vehicleInfo
				case .failure(let error):
					print("Error fetching vehicle info:", error.localizedDescription)
					self.vehicleInfo = nil
				}
			}
		}
	}
}
