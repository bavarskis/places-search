//
//  Data+JSONData.swift
//  PlacesSearchTests
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation
@testable import PlacesSearch

extension Data {
    static func jsonData(filename: String, bundle: Bundle = Bundle.main) throws -> Self {
        guard let path = bundle.path(forResource: filename, ofType: "json") else {
            throw CoreError.generic
        }
        
        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
