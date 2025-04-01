//
//  NetworkService.swift
//  YettelProject
//
//  Created by Macbook on 2025. 03. 30..
//

import Foundation

class NetworkService {
	static let shared = NetworkService()
	private init() {}

	func fetchVehicleInfo(completion: @escaping (Result<VehicleInfo, Error>) -> Void) {
		guard let url = URL(string: "http://localhost:8080/v1/highway/vehicle") else {
			completion(.failure(NetworkError.invalidURL))
			return
		}

		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(error))
				return
			}

			guard let data = data else {
				completion(.failure(NetworkError.noData))
				return
			}

			do {
				let decodedResponse = try JSONDecoder().decode(VehicleInfo.self, from: data)
				DispatchQueue.main.async {
					completion(.success(decodedResponse))
				}
			} catch {
				completion(.failure(NetworkError.decodingError))
			}
		}.resume()
	}

	func fetchVignetteTypes(completion: @escaping (Result<[VignetteType], Error>) -> Void) {
		guard let url = URL(string: "http://localhost:8080/v1/highway/info") else {
			completion(.failure(NetworkError.invalidURL))
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				completion(.failure(error))
				return
			}
			
			guard let data = data else {
				completion(.failure(NetworkError.noData))
				return
			}
			
			do {
				let decodedResponse = try JSONDecoder().decode(HighwayInfoResponse.self, from: data)
				
				let filteredVignettes = decodedResponse.payload.highwayVignettes.filter {
					["DAY", "WEEK", "MONTH"].contains($0.vignetteType)
				}.map {
					VignetteType(name: $0.vignetteType[0], sum: $0.sum)
				}

				DispatchQueue.main.async {
					completion(.success(filteredVignettes))
				}
				
			} catch {
				completion(.failure(NetworkError.decodingError))
			}
		}.resume()
	}
	
	func orderVignette(orderRequest: HighwayOrderRequest, completion: @escaping (Result<Void, Error>) -> Void) {
		guard let url = URL(string: "http://localhost:8080/v1/highway/order") else {
			completion(.failure(NetworkError.invalidURL))
			return
		}

		do {
			let jsonData = try JSONEncoder().encode(orderRequest)

			var request = URLRequest(url: url)
			request.httpMethod = "POST"
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.httpBody = jsonData

			URLSession.shared.dataTask(with: request) { data, response, error in
				if let error = error {
					completion(.failure(error))
					return
				}

				guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
					completion(.failure(NetworkError.noData))
					return
				}

				completion(.success(()))
			}.resume()

		} catch {
			completion(.failure(NetworkError.decodingError))
		}
	}


}

enum NetworkError: Error {
	case invalidURL
	case noData
	case decodingError
}
