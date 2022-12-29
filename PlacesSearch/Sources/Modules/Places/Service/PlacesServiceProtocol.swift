//
//  PlacesServiceProtocol.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation
import CoreLocation

protocol PlacesServiceProtocol {
    var dataFetcher: DataFetching { get }
    var categoryId: String { get }
    func getPlaces(location: CLLocation, radiusInMeters: Int, searchTerm: String) async throws -> [Place]
}

extension PlacesServiceProtocol {
    func getPlaces(location: CLLocation, radiusInMeters: Int, searchTerm: String) async throws -> [Place] {
        let params: Parameters = [
            "categories": categoryId,
            "ll": "\(location.coordinate.latitude),\(location.coordinate.longitude)",
            "radius": radiusInMeters,
            "limit": 50
        ]
        
        let requestParams = RequestParameters.dictionary(params)
        let placesResult: PlacesWrapper = try await dataFetcher.fetch(endpoint: .placesSearch, parameters: requestParams)
        return placesResult.places
    }
}
