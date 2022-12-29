//
//  JSONLoader.swift
//  PlacesSearchTests
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

class JSONLoader {
    static func data(filename: String) throws -> Data {
        // Will use test target bundle
        let bundle = Bundle(for: JSONLoader.self)
        return try Data.jsonData(filename: filename, bundle: bundle)
    }
    
    static func mappedData<DataType: Decodable>(data: Data) throws -> DataType {
        return try JSONDecoder().decode(DataType.self, from: data)
    }
}
