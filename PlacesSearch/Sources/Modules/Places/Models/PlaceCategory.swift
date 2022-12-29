//
//  PlaceCategory.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

struct PlaceCategory: Decodable {
    let id: Int
    let name: String
    let icon: PlaceCategoryIcon
}
