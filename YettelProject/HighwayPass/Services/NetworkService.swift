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
}

enum NetworkError: Error {
	case invalidURL
	case noData
	case decodingError
}
