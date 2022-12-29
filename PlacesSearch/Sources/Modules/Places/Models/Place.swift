//
//  Place.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

struct Place: Decodable, Identifiable {
    let id: String
    let name: String
    let categories: [PlaceCategory]
    let location: PlaceLocation

    enum CodingKeys: String, CodingKey {
        case name, categories, location
        case id = "fsq_id"
    }
}
