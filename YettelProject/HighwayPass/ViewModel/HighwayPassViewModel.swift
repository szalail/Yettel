//
//  HighwayPassViewModel.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 30..
//

import SwiftUI

class HighwayPassViewModel: ObservableObject {
	@Published var vehicleInfo: VehicleInfo?
	@Published var wholeVignetteTypes: [VignetteType] = []

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
	
	func fetchVignetteTypes() {
		NetworkService.shared.fetchVignetteTypes { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let vignetteTypes):
					self.wholeVignetteTypes = vignetteTypes.sorted { $0.sum < $1.sum }
				case .failure(let error):
					print("Error fetching vignette types:", error.localizedDescription)
					self.wholeVignetteTypes = []
				}
			}
		}
	}
}
