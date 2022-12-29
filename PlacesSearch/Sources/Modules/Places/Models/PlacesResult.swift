//
//  PlacesResult.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

struct PlacesWrapper: Decodable {
    let places: [Place]
    
    enum CodingKeys: String, CodingKey {
        case places = "results"
    }
}
