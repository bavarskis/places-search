//
//  PlacesService.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

/// `PlacesService` handles fetching and transforming date related to places
class PlacesService: PlacesServiceProtocol {
    // This is a hardcoded category id for "Dining and Drinking"
    var categoryId: String {
        "13000"
    }
    
    var dataFetcher: DataFetching = {
        DataFetcher()
    }()
}
