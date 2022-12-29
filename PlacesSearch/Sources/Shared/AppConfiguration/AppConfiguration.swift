//
//  AppConfiguration.swift
//  PlacesSearch
//
//  Created by Aurimas Bavarskis on 29/12/2022.
//

import Foundation

struct AppConfiguration {}

extension AppConfiguration: ApiProviding {
    static var scheme: String {
        "https"
    }

    static var domain: String {
        "api.foursquare.com"
    }
    
    static var servicePath: String {
        "/v3"
    }
}

extension AppConfiguration: SessionAuthenticating {
    static var apiToken: ApiToken {
        // API Token is stored in an untracked text file in the bundle.
        // In order for the app to authenticate
        // create a token  at `https://foursquare.com/developers`
        // and store a text file in the bundle
        guard let filepath = Bundle.main.path(forResource: "foursquaretoken", ofType: "txt"),
              let contents = try? String(contentsOfFile: filepath) else {
            assertionFailure("The app cannot function withouth an API token")
            return ""
        }

        return contents
    }
    
    static var authorizationHeader: [String: String] {
        ["Authorization": Self.apiToken]
    }
}
