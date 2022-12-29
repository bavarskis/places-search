//
//  NetworkEndpoint.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

/// `NetworkEndpoint` defines the endpoint from which data needs to be fetched.
/// It constructs `URLComponents` from the passed arguments
struct NetworkEndpoint {
    private(set) var path: String
    let apiProvider: ApiProviding.Type
    
    init(path: String,
         apiProvider: ApiProviding.Type = AppConfiguration.self) {
        self.path = path
        self.apiProvider = apiProvider
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = apiProvider.scheme
        components.host = apiProvider.domain
        components.path = apiProvider.servicePath + path
        return components
    }
}
