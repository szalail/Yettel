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
	@Published var orderSuccess: Bool = false
	@Published var isLoading: Bool = false
	@Published var errorMessage: String? = nil

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

	func orderVignette(_ vignette: VignetteType, completion: @escaping (Bool) -> Void) {
		guard let vehicle = vehicleInfo else {
			print("Error: No vehicle info available")
			completion(false)
			return
		}

		let orderRequest = HighwayOrderRequest(highwayOrders: [
			HighwayOrderRequest.HighwayOrder(type: vignette.name, category: vehicle.type, cost: vignette.sum)
		])

		isLoading = true
		NetworkService.shared.orderVignette(orderRequest: orderRequest) { result in
			DispatchQueue.main.async {
				self.isLoading = false
				switch result {
				case .success:
					self.orderSuccess = true
					completion(true)
				case .failure(let error):
					self.errorMessage = "Order failed: \(error.localizedDescription)"
					print("Error ordering vignette:", error.localizedDescription)
					completion(false)
				}
			}
		}
	}

}
