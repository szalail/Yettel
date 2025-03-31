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
}

enum NetworkError: Error {
	case invalidURL
	case noData
	case decodingError
}
