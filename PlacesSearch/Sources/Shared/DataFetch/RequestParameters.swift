//
//  RequestParameters.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

typealias Parameters = [String: Any]

/// `RequestParameters` is a wrapper object used for passing parameters to URL requests
enum RequestParameters {
    case dictionary(Parameters)
    case empty

    var queryItems: [URLQueryItem] {
        switch self {
        case .dictionary(let parameters):
            return parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        default:
            return []
        }
    }
}
