//
//  PlaceCategoryIcon.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

struct PlaceCategoryIcon: Decodable {
    let prefix: String
    let suffix: String

    let iconSize = "64"
    var url: URL? {
        return URL(string: prefix + iconSize + suffix)
    }

    enum CodingKeys: String, CodingKey {
        case prefix, suffix
    }
}
