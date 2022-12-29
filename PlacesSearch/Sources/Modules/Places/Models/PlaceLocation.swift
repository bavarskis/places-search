//
//  PlaceLocation.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

struct PlaceLocation: Codable {
    let formattedAddress: String

    enum CodingKeys: String, CodingKey {
        case formattedAddress = "formatted_address"
    }
}
